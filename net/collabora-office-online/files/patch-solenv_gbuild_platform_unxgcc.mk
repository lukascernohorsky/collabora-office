--- solenv/gbuild/platform/unxgcc.mk.orig	2025-11-11 20:59:24.708848000 +0100
+++ solenv/gbuild/platform/unxgcc.mk	2025-11-11 20:59:43.136593000 +0100
@@ -151,7 +151,7 @@
 	$(foreach object,$(GENCXXOBJECTS),$(call gb_GenCxxObject_get_target,$(object))) \
 	$(foreach object,$(GENASMOBJECTS),$(call gb_GenAsmObject_get_target,$(object))) \
 	$(foreach object,$(GENNASMOBJECTS),$(call gb_GenNasmObject_get_target,$(object))) \
-	$(foreach extraobjectlist,$(EXTRAOBJECTLISTS),`cat $(extraobjectlist)`) \
+	$(foreach extraobjectlist,$(EXTRAOBJECTLISTS),@$(extraobjectlist)) \
 	$(if $(filter TRUE,$(DISABLE_DYNLOADING)), \
 		-Wl$(COMMA)--start-group \
 		$(shell echo -n \
