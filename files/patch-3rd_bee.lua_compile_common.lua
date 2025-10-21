--- 3rd/bee.lua/compile/common.lua.orig	2025-10-21 17:27:14 UTC
+++ 3rd/bee.lua/compile/common.lua
@@ -163,7 +163,6 @@ lm:lua_source "source_bee" {
         ldflags = "-pthread"
     },
     freebsd = {
-        links = "inotify",
         linkdirs = "/usr/local/lib",
         ldflags = "-pthread"
     },
