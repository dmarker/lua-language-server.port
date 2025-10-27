--- 3rd/luamake/bee.lua/test/test.lua.orig	2025-10-27 14:47:47 UTC
+++ 3rd/luamake/bee.lua/test/test.lua
@@ -42,7 +42,7 @@ do
     if lt.options.touch then
         lt.options.touch = fs.absolute(lt.options.touch):string()
     end
-    local tmpdir = fs.temp_directory_path() / "test_bee"
+    local tmpdir = "%WRKDIR%" .. "/tmp/test_bee"
     fs.create_directories(tmpdir)
     fs.current_path(tmpdir)
 end
