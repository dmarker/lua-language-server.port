--- 3rd/bee.lua/compile/common.lua.orig	2025-10-22 16:50:36 UTC
+++ 3rd/bee.lua/compile/common.lua
@@ -90,7 +90,7 @@ lm:source_set "source_bee" {
         }
     },
     freebsd = {
-        sysincludes = "/usr/local/include",
+        sysincludes = "%LOCALBASE%/include",
         sources = need {
             "bsd",
             "posix",
@@ -163,8 +163,7 @@ lm:lua_source "source_bee" {
         ldflags = "-pthread"
     },
     freebsd = {
-        links = "inotify",
-        linkdirs = "/usr/local/lib",
+        linkdirs = "%LOCALBASE%/lib",
         ldflags = "-pthread"
     },
     openbsd = {
