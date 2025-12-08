[10]: https://github.com/freebsd/freebsd-ports/commit/c2cdd7dd7edc
[11]: https://github.com/markjdb
[12]: https://github.com/actboy168/bee.lua/pull/44/commits/99fc9ebe5619
[13]: https://man.freebsd.org/cgi/man.cgi?query=inotify&manpath=FreeBSD+15.0-STABLE
[14]: https://en.wikipedia.org/wiki/Rube_Goldberg_machine
[15]: https://luals.github.io/
[16]: https://github.com/LuaLS/lua-language-server/issues/2896
[17]: https://github.com/freebsd/freebsd-src/commit/44cb1e857f0
[18]: https://www.freshports.org/devel/libinotify/
[19]: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=291371

# lua-language-server.port

A FreeBSD port.

3.16.0 works on stable/14 with [devel/libinotify][18] from ports.
stable/15 works with the new [inotify(2)][13].

Working on getting this into ports now. So you shouldn't need this much longer.
This will appear very shortly. There have been fixes you will want to pick up
more LuaCATS (for popular languages including thoses used by neovim).

I'm going to leave this here for now but this is merged and I'll be doing my best
to maintain it going forward.

```
# cd /usr/ports/devel
# git clone https://github.com/dmarker/lua-language-server.port.git lua-language-server
# cd lua-language-server
# make install clean
```

The real credit is to [markjdb][11] for tracking down the SIGBUS in bee
[here][12]. That has been merged to both versions of bee.lua this port needs.
So really just adjusting everything to use [inotify(2)][13]. Still has flaky
test but it does pass sometimes.
