# $NetBSD: Makefile,v 1.4 2021/02/13 11:37:34 markd Exp $

DISTNAME=	translator
PKGNAME=	tex-${DISTNAME}-1.12c
TEXLIVE_REV=	56052

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://ctan.org/pkg/translator
COMMENT=	Easy translation of strings in LaTeX
LICENSE=	gnu-gpl-v2 AND lppl-1.3c

DEPENDS+=	tex-graphics-[0-9]*:../../print/tex-graphics

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
