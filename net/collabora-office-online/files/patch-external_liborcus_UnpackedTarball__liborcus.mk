--- external/liborcus/UnpackedTarball_liborcus.mk.orig	2025-11-11 04:17:53.606140000 +0000
+++ external/liborcus/UnpackedTarball_liborcus.mk	2025-11-11 04:18:17.548353000 +0000
@@ -18,6 +18,7 @@
 $(eval $(call gb_UnpackedTarball_add_patches,liborcus,\
 	external/liborcus/rpath.patch.0 \
 	external/liborcus/libtool.patch.0 \
+	external/liborcus/configure.ac.patch.0 \
 ))
 
 ifeq ($(OS),WNT)
