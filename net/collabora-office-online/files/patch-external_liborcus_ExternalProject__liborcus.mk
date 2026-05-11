--- external/liborcus/ExternalProject_liborcus.mk.orig	2025-11-23 20:30:00.393653000 +0100
+++ external/liborcus/ExternalProject_liborcus.mk	2025-11-23 20:30:18.013484000 +0100
@@ -89,7 +89,7 @@
 		$(if $(liborcus_LDFLAGS),LDFLAGS='$(liborcus_LDFLAGS)') \
 		MDDS_CFLAGS='$(MDDS_CFLAGS)' \
 		MDDS_LIBS=' ' \
-		MAKE=$(MAKE) $(gb_RUN_CONFIGURE) ./configure \
+		MAKE=$(MAKE) autoreconf && $(gb_RUN_CONFIGURE) ./configure \
 			--with-pic \
 			$(if $(DISABLE_DYNLOADING), \
 				--enable-static --disable-shared \
