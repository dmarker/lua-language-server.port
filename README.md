[10]: https://github.com/freebsd/freebsd-ports/commit/c2cdd7dd7edc
[11]: https://github.com/markjdb
[12]: https://github.com/actboy168/bee.lua/pull/44/commits/99fc9ebe5619
[13]: https://man.freebsd.org/cgi/man.cgi?query=inotify&manpath=FreeBSD+15.0-STABLE
[14]: https://en.wikipedia.org/wiki/Rube_Goldberg_machine
[15]: https://luals.github.io/
[16]: https://github.com/LuaLS/lua-language-server/issues/2896
[17]: https://github.com/freebsd/freebsd-src/commit/44cb1e857f0

# WARNING

Attempting to build on FreeBSD main (in bhyve at least) is causing OS kernel panic.
This seems to only happen whein 8gb or more of RAM.
It can be worked around with:
```
# sysctl net.inet.tcp.syncache.see_other=1
```
This is fixed with [44cb1e8][17] in main now.

[lua-language-server][15] has a known race in one of the tests, see [issue/2896][16].

# lua-language-server.port

A FreeBSD port.
Requires the new [inotify(2)][13] so stable/15 and above.

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
