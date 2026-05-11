#!/bin/sh
set -eu

usage() {
	cat <<'USAGE'
Usage: fetch-and-prepare-freebsd-port.sh [PORTS_TREE]

Downloads FreeBSD Phabricator D49636 diff id 170989 for Collabora Online,
applies it to a FreeBSD ports tree, then applies the local build-completeness
overlay from this repository.

PORTS_TREE defaults to /usr/ports.
USAGE
}

case "${1:-}" in
	-h|--help)
		usage
		exit 0
		;;
esac

ports_tree=${1:-/usr/ports}
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_dir=$(dirname -- "${script_dir}")
work_dir=${TMPDIR:-/tmp}/collabora-freebsd-port
raw_diff=${work_dir}/D49636-id170989.diff
fix_diff=${repo_dir}/patches/d49636-id170989-build-fixes.diff

primary_url='https://reviews.freebsd.org/file/data/4mgzk6scur3bpjwfi7f5/PHID-FILE-xggxyaofgyfsr4hssz6z/D49636.diff'
fallback_url='https://reviews.freebsd.org/D49636?id=170989&download=true'

if [ ! -d "${ports_tree}" ]; then
	echo "Ports tree not found: ${ports_tree}" >&2
	exit 1
fi

mkdir -p "${work_dir}"

fetch_url() {
	url=$1
	out=$2
	if command -v fetch >/dev/null 2>&1; then
		fetch -qo "${out}" "${url}"
	else
		curl -fsSL "${url}" -o "${out}"
	fi
}

echo "Fetching D49636 diff id 170989..."
if ! fetch_url "${primary_url}" "${raw_diff}"; then
	echo "Primary Phabricator file URL failed; trying Differential download URL..." >&2
	fetch_url "${fallback_url}" "${raw_diff}"
fi

if ! grep -q 'net/collabora-office-online/Makefile' "${raw_diff}"; then
	echo "Downloaded diff does not look like D49636 id 170989." >&2
	exit 1
fi

if ! grep -q 'net/collabora-online/pkg-plist' "${raw_diff}"; then
	echo "Downloaded diff is missing net/collabora-online/pkg-plist." >&2
	exit 1
fi

echo "Applying upstream review diff to ${ports_tree}..."
patch -d "${ports_tree}" -p1 --forward < "${raw_diff}"

echo "Applying local build-completeness overlay..."
patch -d "${ports_tree}" -p1 --forward < "${fix_diff}"

cat <<'DONE'

Done.

Next suggested checks on a FreeBSD builder:
  cd /usr/ports/net/collabora-office-online && make makesum stage-qa
  cd /usr/ports/net/collabora-online && make makesum stage-qa

Notes:
  * The overlay adds files/coolwsd.in, because diff id 170989 declares
    USE_RC_SUBR= coolwsd but does not contain the rc.d template.
  * The overlay also adds runtime dependencies noted in the D49636 discussion:
    collabora-office-online, bash, coreutils, ca_root_nss, and a default font.
DONE
