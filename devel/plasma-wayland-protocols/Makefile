# $NetBSD: Makefile,v 1.2 2021/04/21 11:41:29 adam Exp $

DISTNAME=	plasma-wayland-protocols-1.1.1
PKGREVISION=	1
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_KDE:=plasma-wayland-protocols/1.1.1/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.kde.org/
COMMENT=	Plasma Specific Protocols for Wayland
LICENSE=	gnu-lgpl-v2.1

BUILD_DEPENDS+=	extra-cmake-modules>=5.60.0:../../devel/extra-cmake-modules

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

BUILDLINK_DEPMETHOD.qt5-qtbase=	build
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
