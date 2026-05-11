--- solenv/bin/concat-deps.c.orig	2025-11-11 20:53:22.331290000 +0100
+++ solenv/bin/concat-deps.c	2025-11-11 20:53:52.842282000 +0100
@@ -16,6 +16,10 @@
 #include <string.h>
 #include <unistd.h>
 
+#ifndef O_BINARY
+#define O_BINARY 0
+#endif
+
 #define PREFIX_MAX 128
 #define WORKDIR_MAX 4096
 
