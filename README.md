[10]: https://github.com/freebsd/freebsd-ports/commit/c2cdd7dd7edc
[11]: https://github.com/markjdb
[12]: https://github.com/actboy168/bee.lua/pull/44/commits/99fc9ebe5619
[13]: https://man.freebsd.org/cgi/man.cgi?query=inotify&manpath=FreeBSD+15.0-STABLE
[14]: https://en.wikipedia.org/wiki/Rube_Goldberg_machine

# WARNING

Attempting to build on FreeBSD main (in bhyve at least) is causing OS kernel panic.

I have been building ports as `root` in a jail that only builds ports for a long time.
This is bad as I didn't test building as normal user and that fails on 15.

Basically this is not ready for anything but stable/15 at the moment and only if you
build as root. Work continues...

# lua-language-server.port

A FreeBSD port.
Requires the new [inotify(2)][13] so stable/15 and above.

```
# cd /usr/ports/devel
# git clone https://github.com/dmarker/lua-language-server.port.git lua-language-server
# cd lua-language-server
# make install clean
```

I wish I had seen that there was a prior port that was removed [here][10].
I never noticed `MOVED`. Would have saved some time, but its probably good
as this way I invested time in using the release and submodule assets to build.
Or maybe that's a bad thing.

The real credit is to [markjdb][11] for tracking down the SIGBUS in bee
[here][12]. That has to be fed through both the luamake version of bee
and the version we eventually care about.

I'm just pulling everything back together and getting things to build.
Right now, using the native [inotify(2)][13], it builds and passes all of
its tests (which are part of the build, no I can't change this [build][14]).
