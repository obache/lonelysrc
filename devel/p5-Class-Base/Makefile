# $NetBSD: Makefile,v 1.21 2021/05/24 19:50:15 wiz Exp $

DISTNAME=	Class-Base-0.09
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Class-Base
COMMENT=	Useful base class for deriving other modules
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Clone-[0-9]*:../../devel/p5-Clone

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Class/Base/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
