--- 3rd/bee.lua/3rd/lua54/lobject.h.orig	2025-12-02 15:46:09 UTC
+++ 3rd/bee.lua/3rd/lua54/lobject.h
@@ -462,7 +462,7 @@ typedef struct Udata {
   size_t len;  /* number of bytes */
   struct Table *metatable;
   GCObject *gclist;
-  UValue uv[1];  /* user values */
+  UValue uv[1] __attribute__((__aligned__(16)));  /* user values */
 } Udata;
 
 
