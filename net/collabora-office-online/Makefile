PORTNAME=	collabora-office-online
DISTVERSIONPREFIX=	co-
DISTVERSION=	25.04.7-1
CATEGORIES=	net
MASTER_SITES=	https://dev-www.libreoffice.org/src/ \
		https://dev-www.libreoffice.org/extern/:src1
DIST_SUBDIR=	collabora-office
DISTFILES=	dragonbox-1.1.3.tar.gz \
		mdds-2.1.1.tar.xz \
		zxcvbn-c-2.6.tar.gz \
		frozen-1.2.0.tar.gz \
		libpng-1.6.50.tar.xz \
		pdfium-7012.tar.bz2 \
		afdko-4.0.2.tar.gz \
		liborcus-0.19.2.tar.xz \
		antlr4-cpp-runtime-4.13.2-source.zip \
		f543e6e2d7275557a839a164941c0a86e5f2c3f2a0042bfc434c88c6dde9e140-opens___.ttf:src1

EXTRACT_ONLY=	LibreOffice-core-${DISTVERSIONPREFIX}${DISTVERSION}_GH0.tar.gz \
		LibreOffice-dictionaries-43e5151caa1951fdf03a768f946a19566376dc39_GH0.tar.gz \
		LibreOffice-translations-65f49d9bf5ecc57ac31094de75a9b0a75e544f3d_GH0.tar.gz

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	LibreOffice flavor for online collaboration
WWW=		https://collaboraonline.github.io/

LICENSE=	GPLv3 LGPL3 MPL20
LICENSE_COMB=	multi

BINARY_ALIAS=	sed=gsed
BUILD_DEPENDS=	autoconf>=2.72:devel/autoconf \
		afdko>=4.0.2:x11-fonts/afdko \
		automake>=1.17:devel/automake \
		bash>=5.3.3:shells/bash \
		nasm>=2.16.0.3:devel/nasm \
		fontconfig>=2.12:x11-fonts/fontconfig \
		gsed:textproc/gsed \
		gperf>=3.2.1:devel/gperf \
		patch>=2.7.6:devel/patch \
		cppunit-config:devel/cppunit \
		zip>=3.0:archivers/zip \
		${LOCALBASE}/include/glm/glm.hpp:math/glm \
		${LOCALBASE}/include/fast_float/fast_float.h:math/fast_float \
		${LOCALBASE}/include/sqlext.h:databases/unixODBC \
		${LOCALBASE}/include/sane/sane.h:graphics/sane-backends

LIB_DEPENDS=	libboost_date_time.so:devel/boost-libs \
		libnss3.so:security/nss \
		libsmime3.so:security/nss \
		libssl3.so:security/nss \
		libnssutil3.so:security/nss \
		libplds4.so:devel/nspr \
		libplc4.so:devel/nspr \
		libnspr4.so:devel/nspr \
		liblangtag.so:devel/liblangtag \
		libexpat.so:textproc/expat2 \
		libraptor2.so:textproc/raptor2 \
		liblcms2.so:graphics/lcms2 \
		liblcms2_fast_float.so:graphics/lcms2 \
		liblcms2_threaded.so:graphics/lcms2 \
		libtiff.so:graphics/tiff \
		libwebp.so:graphics/webp \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libltdl.so:devel/libltdl \
		libCbcSolver.so:math/cbc \
		libCbc.so:math/cbc \
		libnauty.so:math/nauty \
		libCgl.so:math/cgl \
		libOsi.so:math/osi \
		libOsiClp.so:math/clp \
		libClpSolver.so:math/clp \
		libClp.so:math/clp \
		libCoinUtils.so:math/coinutils \
		libcoinasl.so:math/asl \
		libcoinmumps.so:math/coin-or-mumps \
		libicuuc.so:devel/icu \
		libcurl.so:ftp/curl \
		libopenblas.so:math/openblas \
		libcmis-0.6.so:net/libcmis \
		libmd4c.so.0:textproc/md4c \
		libjpeg.so.8:graphics/jpeg-turbo \
		libclucene-core.so:textproc/clucene \
		libxmlsec1-nss.so:security/xmlsec1 \
		librevenge-0.0.so:textproc/librevenge \
		libodfgen-0.1.so:textproc/libodfgen01 \
		libepubgen-0.1.so:textproc/libepubgen \
		libwpd-0.10.so:textproc/libwpd010 \
		libwpg-0.3.so:graphics/libwpg03 \
		libwps-0.4.so:textproc/libwps \
		libvisio-0.1.so:textproc/libvisio01 \
		libcdr-0.1.so:graphics/libcdr01 \
		libmspub-0.1.so:print/libmspub01 \
		libmwaw-0.3.so:textproc/libmwaw03 \
		libetonyek-0.1.so:graphics/libetonyek01 \
		libfreehand-0.1.so:graphics/libfreehand \
		libe-book-0.1.so:textproc/libe-book \
		libabw-0.1.so:textproc/libabw \
		libpagemaker-0.0.so:print/libpagemaker \
		libqxp-0.0.so:textproc/libqxp \
		libzmf-0.0.so:graphics/libzmf \
		libstaroffice-0.0.so:textproc/libstaroffice \
		libgraphite2.so:graphics/graphite2 \
		libharfbuzz.so:print/harfbuzz \
		libharfbuzz-icu.so:print/harfbuzz-icu \
		libargon2.so:security/libargon2 \
		librdf.so:textproc/redland \
		libhunspell-1.7.so:textproc/hunspell \
		libZXing.so:textproc/zxing-cpp \
		libbox2d.so:misc/box2d \
		libhyphen.so:textproc/hyphen \
		libmythes-1.2.so:textproc/mythes \
		libCoinMP.so:math/coinmp \
		libexttextcat-2.0.so:textproc/libexttextcat \
		libnumbertext-1.0.so:textproc/libnumbertext \
		libabsl_strings.so:devel/abseil

CONFIGURE_ENV+=	CFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		CXXFLAGS="-I${LOCALBASE}/include"
MAKE_ENV+=	${CONFIGURE_ENV} \
		GNUSED=${LOCALBASE}/bin/gsed

USES=		bison gmake perl5 pkgconfig gnome python gettext ldap localbase:ldflags ssl
USE_LDCONFIG=	${PREFIX}/share/collabora-office-online/instdir/program
USE_GNOME=	libxml2 libxslt cairo
USE_GITHUB=	yes
GH_ACCOUNT=	LibreOffice
GH_PROJECT=	core
GH_TAGNAME=	${DISTVERSIONPREFIX}${DISTVERSION}
GH_TUPLE=	LibreOffice:translations:65f49d9bf5ecc57ac31094de75a9b0a75e544f3d:translations/translations \
		LibreOffice:dictionaries:43e5151caa1951fdf03a768f946a19566376dc39:dictionaries/dictionaries

GNU_CONFIGURE=	no
CC=		cc
CXX=		c++
ALL_TARGET=	""

CONFIGURE_ARGS=	--disable-dependency-tracking \
		--with-system-libs \
		--disable-firebird-sdbc \
		--disable-online-update \
		--disable-dbgutil \
		--enable-release-build \
		--enable-hardening-flags \
		--enable-mpl-subset \
		--with-vendor="FreeBSD Ports" \
		--enable-community-flavor \
		--with-system-dicts \
		--with-system-nss \
		--with-myspell-dicts \
		--with-system-openjpeg=no \
		--disable-poppler \
		--with-system-orcus=no \
		--with-system-boost \
		--with-boost=${LOCALBASE} \
		--with-system-mdds=no \
		--with-system-abseil \
		--with-system-argon2 \
		--with-system-cppunit \
		--with-system-curl \
		--with-system-expat \
		--with-system-icu \
		--with-system-fast-float \
		--with-system-dragonbox=no \
		--with-system-frozen=no \
		--with-system-gpgmepp \
		--with-system-libtiff \
		--with-system-libxml \
		--with-system-liblangtag \
		--with-system-zlib \
		--with-system-zxcvbn=no \
		--with-system-zxing \
		--with-system-libfixmath=no \
		--with-system-libpng=no \
		--enable-mergelibs \
		--without-java \
		--without-junit \
		--without-help \
		--with-linker-hash-style=both \
		--without-fonts \
		--with-galleries=no \
		--with-theme="colibre colibre_svg" \
		--disable-dbus \
		--enable-extension-integration \
		--disable-odk \
		--disable-kf5 \
		--disable-gtk3 \
		--disable-qt5 \
		--disable-gstreamer-1-0 \
		--disable-evolution2 \
		--disable-gio \
		--disable-gui \
		--disable-scripting-beanshell \
		--disable-scripting-javascript \
		--disable-ext-wiki-publisher \
		--disable-report-builder \
		--disable-ext-nlpsolver \
		--disable-sdremote \
		--disable-sdremote-bluetooth \
		--disable-postgresql-sdbc \
		--disable-randr \
		--disable-epm \
		--enable-python=system \
		--disable-dconf \
		--without-package-format \
		--with-lang="ar bg ca cs da de el en-US en-GB eo es eu fi fr gl he hr hu hy id is it ja ko lo nb nl oc pl pt pt-BR sq ru sk sl sv tr uk vi zh-CN zh-TW" \
		--with-external-thes-dir=${LOCALBASE}/share/mythes \
		--with-external-hyph-dir=${LOCALBASE}/share/hyphen \
		--with-external-dict-dir=${LOCALBASE}/share/hunspell \
		--disable-lotuswordpro \
		--disable-lpsolve \
		--enable-sal-log \
		--without-templates \
		--with-buildconfig-recorded \
		--with-gnu-patch=/usr/local/bin/gpatch \
		--disable-fetch-external \
		--with-external-tar=${DISTDIR}/${DIST_SUBDIR}

post-patch:
	${CP} ${FILESDIR}/configure.ac.patch.0 ${WRKSRC}/external/liborcus/configure.ac.patch.0

do-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ./autogen.sh CC=${CC} CXX=${CXX} ${CONFIGURE_ARGS}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}/include
	${MKDIR} ${STAGEDIR}${PREFIX}/share/${PORTNAME}
	${CP} -a ${WRKSRC}/instdir ${STAGEDIR}${PREFIX}/share/${PORTNAME}
	${CP} -a ${WRKSRC}/include/LibreOfficeKit ${STAGEDIR}${PREFIX}/include/${PORTNAME}/include

post-install:
	@cd ${STAGEDIR}${PREFIX} && \
		${FIND} -s share/${PORTNAME}/instdir include/${PORTNAME}/include -type d -empty \
		-exec ${ECHO_CMD} "@dir {}" \; >> ${TMPPLIST}
	@cd ${STAGEDIR}${PREFIX} && \
		${FIND} -s share/${PORTNAME}/instdir include/${PORTNAME}/include -not -type d >> ${TMPPLIST}

.include <bsd.port.mk>
