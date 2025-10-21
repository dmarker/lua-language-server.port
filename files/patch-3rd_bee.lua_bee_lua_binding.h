--- 3rd/bee.lua/bee/lua/binding.h.orig	2025-10-21 15:14:31 UTC
+++ 3rd/bee.lua/bee/lua/binding.h
@@ -198,6 +198,7 @@ namespace bee::lua {
     template <typename T, typename... Args>
     T& newudata(lua_State* L, Args&&... args) {
         static_assert(udata_has_name<T>::value);
+        static_assert(_Alignof(T) <= 16);
         int nupvalue = 0;
         if constexpr (udata_has_nupvalue<T>::value) {
             nupvalue = udata<T>::nupvalue;
