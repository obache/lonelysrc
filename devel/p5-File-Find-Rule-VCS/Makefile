# $NetBSD: Makefile,v 1.20 2021/05/24 19:50:40 wiz Exp $

DISTNAME=	File-Find-Rule-VCS-1.08
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	11
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/File-Find-Rule-VCS
COMMENT=	File::Find::Rule extension to Exclude files/directories for VCS's
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-File-Find-Rule>=0.20:../../devel/p5-File-Find-Rule
DEPENDS+=	p5-Text-Glob>=0.08:../../textproc/p5-Text-Glob

PERL5_MODULE_TYPE=	Module::Install::Bundled
PERL5_PACKLIST=		auto/File/Find/Rule/VCS/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
