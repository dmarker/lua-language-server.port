--- 3rd/luamake/bee.lua/3rd/fmt/fmt/color.h.orig	2025-12-02 15:29:27 UTC
+++ 3rd/luamake/bee.lua/3rd/fmt/fmt/color.h
@@ -8,6 +8,7 @@
 #ifndef FMT_COLOR_H_
 #define FMT_COLOR_H_
 
+#include <algorithm>
 #include "format.h"
 
 FMT_BEGIN_NAMESPACE
