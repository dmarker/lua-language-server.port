--- 3rd/bee.lua/compile/common.lua.orig	2025-12-02 15:50:47 UTC
+++ 3rd/bee.lua/compile/common.lua
@@ -207,7 +207,7 @@ lm:source_set "source_bee" {
         }
     },
     freebsd = {
-        sysincludes = "/usr/local/include",
+        sysincludes = "%LOCALBASE%/include",
         sources = need {
             "bsd",
             "posix",
@@ -291,8 +291,7 @@ lm:source_set "source_bee" {
         ldflags = "-pthread"
     },
     freebsd = {
-        links = "inotify",
-        linkdirs = "/usr/local/lib",
+        linkdirs = "%LOCALBASE%/lib",
         ldflags = "-pthread"
     },
     openbsd = {
