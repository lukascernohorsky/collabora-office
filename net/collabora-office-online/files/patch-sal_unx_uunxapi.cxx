--- sal/osl/unx/uunxapi.cxx.orig	2025-11-11 03:06:49.208584000 +0100
+++ sal/osl/unx/uunxapi.cxx	2025-11-11 03:11:01.467063000 +0100
@@ -615,6 +615,7 @@
 #pragma clang diagnostic ignored "-Wdeprecated-pragma"
 #endif
 #endif
+#ifdef ENOSTR
     case ENOSTR:
 #if defined __clang__
 #if __has_warning("-Wdeprecated-pragma")
@@ -622,12 +623,14 @@
 #endif
 #endif
         return "ENOSTR";
+#endif
 #if defined __clang__
 #if __has_warning("-Wdeprecated-pragma")
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-pragma"
 #endif
 #endif
+#ifdef ENODATA
     case ENODATA:
 #if defined __clang__
 #if __has_warning("-Wdeprecated-pragma")
@@ -635,12 +638,14 @@
 #endif
 #endif
         return "ENODATA";
+#endif
 #if defined __clang__
 #if __has_warning("-Wdeprecated-pragma")
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-pragma"
 #endif
 #endif
+#ifdef ETIME
     case ETIME:
 #if defined __clang__
 #if __has_warning("-Wdeprecated-pragma")
@@ -648,6 +653,7 @@
 #endif
 #endif
         return "ETIME";
+#endif
