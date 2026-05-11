# Collabora Online FreeBSD ports overlay

This repository contains a ready-to-copy FreeBSD ports overlay for the Collabora
Online review from FreeBSD Phabricator **D49636, diff id 170989**:

<https://reviews.freebsd.org/D49636?id=170989>

## Included ports files

* `net/collabora-office-online/` - the LibreOffice/Collabora Office runtime port.
* `net/collabora-online/` - the Collabora Online server port.
* `UIDs` and `GIDs` snippets for the `collaboraonline` user and group.
* `net/Makefile.inc` with the two `SUBDIR` lines to add to a ports tree.

The tree also includes a local build-completeness fix from the D49636 discussion:
`net/collabora-online/files/coolwsd.in` is present, runtime dependencies needed
for `coolwsd` are declared, and the large Collabora Online plist is generated at
stage time instead of storing thousands of browser asset paths by hand.

## Copy into a FreeBSD ports tree

```sh
# From this repository:
cp -a net/collabora-office-online /usr/ports/net/
cp -a net/collabora-online /usr/ports/net/

# Merge these snippets manually:
cat UIDs
cat GIDs
cat net/Makefile.inc
```

Then add the `UIDs`, `GIDs`, and `net/Makefile` entries to the matching files in
`/usr/ports`.

## Build order

```sh
cd /usr/ports/net/collabora-office-online
make makesum stage-qa

cd /usr/ports/net/collabora-online
make makesum stage-qa
```

After installing, follow the `pkg-message` instructions to create the Collabora
systemplate and enable the `coolwsd` rc service.
