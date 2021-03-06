# $NetBSD: Makefile,v 1.222 2021/05/31 11:08:45 wiz Exp $

DISTNAME=	gnutls-3.7.2
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG:=gnutls/v${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnutls.org/
COMMENT=	Transport Layer Security library
LICENSE=	gnu-gpl-v3 AND gnu-lgpl-v2.1

DEPENDS+=	mozilla-rootcerts-[0-9]*:../../security/mozilla-rootcerts

PLIST_SRC=	PLIST

USE_LANGUAGES=			c c++
USE_LIBTOOL=			yes
USE_TOOLS+=			gmake gsed perl pkg-config bash
USE_TOOLS+=			msgfmt msgmerge xgettext
GNU_CONFIGURE=			yes
# this library duplicates (and conflicts with) openssl
CONFIGURE_ARGS+=		--disable-openssl-compatibility
CONFIGURE_ARGS+=		--without-idn
CONFIGURE_ARGS+=		--without-tpm
CONFIGURE_ARGS+=		--disable-valgrind-tests
CONFIGURE_ARGS+=		--with-default-trust-store-file=${PREFIX}/share/mozilla-rootcerts/cacert.pem
CONFIGURE_ARGS+=		--with-libintl-prefix=${BUILDLINK_PREFIX.gettext}
CONFIGURE_ARGS+=		--enable-local-libopts
# Assembler support is broken for SunOS in 3.2.9.
CONFIGURE_ARGS.SunOS+=		--disable-hardware-acceleration
CONFIGURE_ARGS.FreeBSD+=	ac_cv_type_max_align_t=yes

.include "options.mk"

# one failure as of 3.7.1
# https://gitlab.com/gnutls/gnutls/-/issues/1190
TEST_TARGET=		check

INFO_FILES=		yes

REPLACE_BASH+=		tests/danetool.sh
REPLACE_BASH+=		tests/fastopen.sh
REPLACE_BASH+=		tests/gnutls-cli-debug.sh
REPLACE_BASH+=		tests/starttls.sh

REPLACE_PERL+=		doc/scripts/gdoc doc/scripts/sort2.pl

PKGCONFIG_OVERRIDE=	lib/gnutls.pc.in
PKGCONFIG_OVERRIDE+=	libdane/gnutls-dane.pc.in

MAKE_ENV+=		RM=${RM:Q}
MAKE_ENV+=		TZ=UTC

SUBST_CLASSES+=		shell
SUBST_SED.shell+=	-e 's,define POSIX_SHELL .*,define POSIX_SHELL "'${TOOLS_PATH.bash}'",'
SUBST_STAGE.shell=	post-configure
SUBST_FILES.shell+=	config.h
SUBST_MESSAGE.shell=	Fixing path to bash.

EGDIR=		${PREFIX}/share/examples/gnutls

INSTALLATION_DIRS=	${EGDIR} include/gnutls

.include "../../mk/bsd.prefs.mk"

.if ${MACHINE_ARCH} == "x86_64"
GNUTLS_GAS_VERSION!=	\
	( env LC_ALL=C as --version 2>&1 | ${GREP} 'GNU assembler version' | ${AWK} '{print $$4}') 2>/dev/null || ${ECHO} 0
.  if ${GNUTLS_GAS_VERSION} != 0
GNUTLS_GAS_NEW_ENOUGH=	no
# for ssse3, >=2.22
# better to BUILD_DEPENDS on binutils's gas
GNUTLS_GAS_ACCEPTABLE_PATTERNS=	\
	2.2[2-9]		\
	2.2[2-9].*		\
	2.2[2-9]-[0-9]*.*	\
	2.[3-9][0-9]		\
	2.[3-9][0-9].*		\
	2.[3-9][0-9]-[0-9]*.*	\
	[3-9]*.*
.    for gas_pattern in ${GNUTLS_GAS_ACCEPTABLE_PATTERNS}
.      if !empty(GNUTLS_GAS_VERSION:M${gas_pattern})
GNUTLS_GAS_NEW_ENOUGH=	yes
.      endif
.    endfor
.    if !empty(GNUTLS_GAS_NEW_ENOUGH:M[nN][oO])
CONFIGURE_ARGS+=	--disable-hardware-acceleration
.    endif
.  endif
.endif

post-install:
	cd ${WRKSRC}/doc/examples && ${INSTALL_DATA} *.c ${DESTDIR}${EGDIR}

.include "../../archivers/lzo/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.gmp+=		gmp>=5.0
.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/libcfg+/buildlink3.mk"
# Avoid creating a fake zlib.pc, because if it does
# gnutls will add a Requires.private for it in its .pc file
SKIP_FAKE_PC_FILES+=	zlib
.include "../../devel/zlib/buildlink3.mk"
# guile is useful for selftests, but bindings should be separate pkgs
#.include "../../lang/guile20/buildlink3.mk"
BUILDLINK_API_DEPENDS.libtasn1+=	libtasn1>=4.9
.include "../../security/libtasn1/buildlink3.mk"
BUILDLINK_API_DEPENDS.nettle+=		nettle>=3.6
.include "../../security/nettle/buildlink3.mk"
BUILDLINK_API_DEPENDS.p11-kit+=	p11-kit>=0.23.1
.include "../../security/p11-kit/buildlink3.mk"
.include "../../textproc/libunistring/buildlink3.mk"
.include "../../mk/readline.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
