PORTNAME=	lua-language-server
PORTVERSION=	3.16.0
CATEGORIES=	devel
                                                       
MAINTAINER=	dave@freedave.net
COMMENT=	Lua development server and LSP client
WWW=		https://luals.github.io

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

# This passes tests with and without libinotify for 3.16.0!
# But I don't have a stable/13 to test ...
#IGNORE_FreeBSD_13="missing native inotify"

# conditionally bring in libinotify for stable/14 and below
# XXX this doesn't work. chicken and egg we need OSVERSION defined
LIB_DEPENDS+=   ${LIBINOTIFY}

USES=		tar dos2unix lua:build ninja:make
DOS2UNIX_REGEX= .*\.(cpp|h|lua|md|obj)
USE_GITHUB=	yes
GH_ACCOUNT=	LuaLS
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${DISTVERSION}

# Put these in order of # https://github.com/LuaLS/lua-language-server/tree/5f1226d/3rd
# But there is one more `bee.lua` for `luamake` and it doesn't necessarily have the same
# SHA. Have to follow the 3rd/luamake and see what it wants.
GH_TUPLE=	cppcxy:EmmyLuaCodeStyle:8500f3a:emmyluacodestyle/3rd/EmmyLuaCodeStyle \
		actboy168:bee.lua:dd7853f:bee/3rd/bee.lua \
		actboy168:json.lua:aff2a3d:json/3rd/json.lua \
		love2d-community:love-api:8536392:love/3rd/love-api \
		bjornbytes:lovr-docs:e89c753:lovr/3rd/lovr-api \
		sqmedeiros:lpeglabel:912b0b9:lpeglabel/3rd/lpeglabel \
		actboy168:luamake:0e90778:luamake/3rd/luamake \
		actboy168:bee.lua:f242926:bee_luamake/3rd/luamake/bee.lua

SUB_FILES=	lua-language-server

PLIST_FILES=	bin/lua-language-server \
		${DATADIR_REL}/bin/lua-language-server \
		${DATADIR_REL}/bin/main.lua \
		${DATADIR_REL}/debugger.lua \
		${DATADIR_REL}/main.lua

PORTDATA=	locale meta script

post-patch:
	${REINPLACE_CMD} -e 's|%LOCALBASE%|${LOCALBASE}|' ${WRKSRC}/3rd/bee.lua/compile/common.lua
	${REINPLACE_CMD} -e 's|%INOTIFY%|${INOTIFY}|' ${WRKSRC}/3rd/bee.lua/compile/common.lua
	${REINPLACE_CMD} -e 's|%LOCALBASE%|${LOCALBASE}|' ${WRKSRC}/3rd/luamake/compile/ninja/freebsd.ninja
	${REINPLACE_CMD} -e 's|%LINK_INOTIFY%|${LINK_INOTIFY}|' ${WRKSRC}/3rd/luamake/compile/ninja/freebsd.ninja
	${REINPLACE_CMD} -e 's|%WRKDIR%|${WRKDIR}|' ${WRKSRC}/3rd/luamake/bee.lua/test/test.lua
	${REINPLACE_CMD} -e 's|%WRKDIR%|${WRKDIR}|' ${WRKSRC}/3rd/bee.lua/test/test.lua

# `luamake all` instead of `luamake rebuild` because there is a flaky test
do-build:
	cd ${WRKSRC}/3rd/luamake && compile/build.sh
	cd ${WRKSRC} && 3rd/luamake/luamake all

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/bin
	${INSTALL_SCRIPT} ${WRKDIR}/lua-language-server ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/lua-language-server ${STAGEDIR}${DATADIR}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/main.lua ${STAGEDIR}${DATADIR}/bin
	${INSTALL_DATA} ${WRKSRC}/debugger.lua ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/main.lua ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} "locale meta script" ${STAGEDIR}${DATADIR}

# you may hit https://github.com/LuaLS/lua-language-server/issues/2896
do-test:
	cd ${WRKSRC} && 3rd/luamake/luamake unit-test

.include <bsd.port.pre.mk>
#.include <bsd.port.mk>

.if ${OSVERSION} < 1500050
LIBINOTIFY=	libinotify.so:devel/libinotify
INOTIFY=	links = "inotify",
LINK_INOTIFY=	-linotify
.endif

.include <bsd.port.post.mk>
