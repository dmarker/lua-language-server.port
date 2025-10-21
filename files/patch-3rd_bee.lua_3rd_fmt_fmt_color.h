--- 3rd/bee.lua/3rd/fmt/fmt/color.h.orig	2025-10-21 15:22:32 UTC
+++ 3rd/bee.lua/3rd/fmt/fmt/color.h
@@ -8,6 +8,7 @@
 #ifndef FMT_COLOR_H_
 #define FMT_COLOR_H_
 
+#include <algorithm>
 #include "format.h"
 
 FMT_BEGIN_NAMESPACE
