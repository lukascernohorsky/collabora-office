PORTNAME=	collabora-online
DISTVERSIONPREFIX=	cp-
DISTVERSION=	25.04.7-1
CATEGORIES=	net
MASTER_SITES=	LOCAL/jsm:source1
DISTFILES=	node-modules-${DISTVERSIONPREFIX}${GH_PROJECT}-${DISTVERSION}.tar.gz:source1

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	CollaboraOnline CODE server
WWW=		https://www.collaboraonline.com/code/

LICENSE=	MPL20

USES=		autoreconf iconv:wchar_t gmake libtool localbase nodejs pkgconfig python ssl python:env
USE_GITHUB=	yes
GH_ACCOUNT=	collaboraonline
GH_PROJECT=	online
USE_RC_SUBR=	coolwsd

PATCH_SITES=	https://github.com/jsm222/online/commit/
PATCHFILES=	3d5fad0655f922928c398e64f11e2cbfa9a56546.diff:-p1 \
		aec4281a4902fed29a741579f439435050d76544.diff:-p1 \
		33979b70c51282e97dee3c27b828843ae4d6b88a.diff:-p1 \
		05af5eba22fd45363b9b8a402ac4882b0432c1d0.diff:-p1 \
		64f22585d36d01df37afbde1ee039c52f944faa3.diff:-p1 \
		3ab3adc64435c8e03ee057ecdad61cb3023c29a4.diff:-p1

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/lxml/__init__.py:devel/py-lxml \
		${LOCALBASE}/include/collabora-office-online/include/LibreOfficeKit/LibreOfficeKit.h:net/collabora-office-online \
		${PYTHON_SITELIBDIR}/polib.py:devel/py-polib \
		npm:www/npm-node${NODEJS_VERSION} \
		rsync:net/rsync \
		${LOCALBASE}/lib/libcppunit.so:devel/cppunit \
		bash:shells/bash \
		grealpath:sysutils/coreutils
RUN_DEPENDS=	${LOCALBASE}/share/collabora-office-online/instdir/program/soffice:net/collabora-office-online \
		grealpath:sysutils/coreutils \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss \
		${LOCALBASE}/share/fonts/dejavu/DejaVuSans.ttf:x11-fonts/dejavu
LIB_DEPENDS=	libzstd.so:archivers/zstd \
		libpng16.so:graphics/png \
		libPocoNet.so:devel/poco

SUB_FILES=	pkg-message
USERS=		collaboraonline
GROUPS=		collaboraonline
CC=		cc
CXX=		c++
CPPFLAGS+=	-DLOK_LOADLIB_GLOBAL

CONFIGURE_ARGS=	--prefix=${LOCALBASE} --sysconfdir=${LOCALBASE}/etc \
		--localstatedir=/var \
		--enable-silent-rules \
		--with-lokit-path=${LOCALBASE}/include/collabora-office-online/include \
		--disable-seccomp \
		--with-poco-includes=${LOCALBASE}/include --disable-tests \
		--disable-dependency-tracking \
		--with-lo-path=${LOCALBASE}/share/collabora-office-online/instdir \
		--with-dictionaries="ar bg ca cs da de el en eo es eu fi fr gl he hr hu hy id is it ja ko lo nb nl oc pl pt pt-BR sq ru sk sl sv tr uk vi zh-CN zh-TW" \
		--with-user-id=collaboraonline \
		--disable-tests
GNU_CONFIGURE=	yes

post-extract:
	${CP} ${FILESDIR}/collabora-online-sbom.spdx.json ${WRKSRC}/collabora-online-sbom.spdx.json
	${TAR} -C ${WRKSRC}/browser -xvzf ${DISTDIR}/node-modules-${DISTVERSIONPREFIX}${GH_PROJECT}-${DISTVERSION}.tar.gz

post-patch:
	${REINPLACE_CMD} s/python3/${PYTHON_VERSION}/g ${WRKSRC}/scripts/create-sbom.py \
		${WRKSRC}/configure.ac \
		${WRKSRC}/Makefile.am \
		${WRKSRC}/browser/util/po2json.py \
		${WRKSRC}/browser/util/appendwelcome.py \
		${WRKSRC}/scripts/unocommands.py

post-install:
	${CHMOD} 4755 ${STAGEDIR}${PREFIX}/bin/coolmount
	${CHMOD} 4755 ${STAGEDIR}${PREFIX}/bin/coolforkit-caps
	${INSTALL_DATA} ${STAGEDIR}${PREFIX}/etc/coolwsd/coolwsd.xml ${STAGEDIR}${PREFIX}/etc/coolwsd/coolwsd.xml.sample
	@cd ${STAGEDIR}${PREFIX} && ${FIND} -s bin etc libexec share -type d -empty \
		-exec ${ECHO_CMD} "@dir {}" \; >> ${TMPPLIST}
	@cd ${STAGEDIR}${PREFIX} && ${FIND} -s bin etc libexec share -not -type d | \
		${SED} -e '/^etc\/rc.d\/coolwsd$$/d' \
			-e '/^etc\/coolwsd\/coolwsd.xml.sample$$/d' \
			-e 's|^etc/coolwsd/coolwsd.xml$$|@sample etc/coolwsd/coolwsd.xml.sample etc/coolwsd/coolwsd.xml|' \
		>> ${TMPPLIST}

.include <bsd.port.mk>
