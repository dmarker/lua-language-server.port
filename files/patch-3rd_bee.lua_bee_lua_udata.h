--- 3rd/bee.lua/bee/lua/udata.h.orig	2025-12-02 15:49:31 UTC
+++ 3rd/bee.lua/bee/lua/udata.h
@@ -66,6 +66,7 @@ namespace bee::lua {
     template <typename T, typename... Args>
     T& newudata(lua_State* L, Args&&... args) {
         int nupvalue = 0;
+        static_assert(_Alignof(T) <= 16);
         if constexpr (udata_has_nupvalue<T>::value) {
             nupvalue = udata<T>::nupvalue;
         }
