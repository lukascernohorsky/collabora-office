# Collabora Online FreeBSD port helper

This repository prepares the files needed to test the Collabora Online FreeBSD
port from FreeBSD Phabricator review **D49636, diff id 170989**.

Source review: <https://reviews.freebsd.org/D49636?id=170989>

## What is included

* `manifest/freebsd-port-files.txt` lists every file added or modified by diff
  id 170989, plus the extra rc.d file needed to make the port build complete.
* `patches/d49636-id170989-build-fixes.diff` adds the missing
  `net/collabora-online/files/coolwsd.in` template and runtime dependencies
  called out in the review discussion.
* `scripts/fetch-and-prepare-freebsd-port.sh` downloads the Phabricator diff,
  applies it to a ports tree, and then applies the local overlay patch.

## Usage on FreeBSD

```sh
git clone <this repository>
cd collabora-office
./scripts/fetch-and-prepare-freebsd-port.sh /usr/ports
```

Then build the two ports in order:

```sh
cd /usr/ports/net/collabora-office-online
make makesum stage-qa

cd /usr/ports/net/collabora-online
make makesum stage-qa
```

## Why there is an overlay

The D49636 page records a tester note from March 1, 2026 that diff id 170989 is
missing `files/coolwsd.in`, while `net/collabora-online/Makefile` still sets
`USE_RC_SUBR= coolwsd`.  Without that rc.d template the port is incomplete.  The
same note says runtime execution needed `collabora-office-online`, `bash`,
`coreutils`, and `ca_root_nss`; the overlay records those as runtime
dependencies and adds a default font package so `coolwsd-systemplate-setup` has
`/usr/local/share/fonts` available on minimal systems.
