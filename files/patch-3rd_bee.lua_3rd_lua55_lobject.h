--- 3rd/bee.lua/3rd/lua55/lobject.h.orig	2025-12-02 15:47:05 UTC
+++ 3rd/bee.lua/3rd/lua55/lobject.h
@@ -494,7 +494,7 @@ typedef struct Udata {
   size_t len;  /* number of bytes */
   struct Table *metatable;
   GCObject *gclist;
-  UValue uv[1];  /* user values */
+  UValue uv[1] __attribute__((__aligned__(16)));  /* user values */
 } Udata;
 
 
