--- 3rd/bee.lua/3rd/lua/lobject.h.orig	2025-10-21 15:14:13 UTC
+++ 3rd/bee.lua/3rd/lua/lobject.h
@@ -462,7 +462,7 @@ typedef struct Udata {
   size_t len;  /* number of bytes */
   struct Table *metatable;
   GCObject *gclist;
-  UValue uv[1];  /* user values */
+  UValue uv[1] __attribute__((__aligned__(16)));  /* user values */
 } Udata;
 
 
