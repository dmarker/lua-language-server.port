PORTNAME=	lua-language-server
PORTVERSION=	3.15.0
CATEGORIES=	devel
                                                       
# Fortunately they bundled all the submodules for us now.
MASTER_SITES=	https://github.com/LuaLS/lua-language-server/releases/download/${PORTVERSION}/
DISTFILES=	${PORTNAME}-${PORTVERSION}-submodules.zip

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Lua development server and LSP client
WWW=		https://luals.github.io

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

#BUILD_DEPENDS=	lua54:lang/lua54 \
#		unzip:archivers/unzip \
#		ninja:devel/ninja

USES=           zip tar dos2unix lua:build ninja:make
DOS2UNIX_REGEX= .*\.(cpp|h|lua|md|obj)
SUB_FILES=	lua-language-server
PLIST_FILES=	bin/lua-language-server \
		${DATADIR_REL}/bin/lua-language-server \
		${DATADIR_REL}/bin/main.lua \
		${DATADIR_REL}/debugger.lua \
		${DATADIR_REL}/main.lua

PORTDATA=	locale meta script

USE_GITHUB=	yes
GH_ACCOUNT=	LuaLS
GH_PROJECT=	${PORTNAME:tl}
GH_TAGNAME=	${DISTVERSION}


# I'm sure there is a better way I just don't know it...
# And if I try to let the bsd.port.mk handle extract it complains about zip for submodules.
do-extract:
	@${MKDIR} ${WRKSRC}
	@${TAR} zxf ${DISTDIR}/LuaLS-${PORTNAME}-${PORTVERSION}_GH0.tar.gz \
		-C ${WRKDIR}
	@${UNZIP_CMD} -uo ${DISTDIR}/${PORTNAME}-${PORTVERSION}-submodules.zip \
		-d ${WRKSRC}

do-build:
	cd ${WRKSRC}/3rd/luamake && compile/build.sh
	cd ${WRKSRC} && 3rd/luamake/luamake rebuild

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/bin
	${INSTALL_SCRIPT} ${WRKDIR}/lua-language-server ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/lua-language-server ${STAGEDIR}${DATADIR}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/main.lua ${STAGEDIR}${DATADIR}/bin
	${INSTALL_DATA} ${WRKSRC}/debugger.lua ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/main.lua ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} "locale meta script" ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
