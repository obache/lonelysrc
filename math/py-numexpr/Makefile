# $NetBSD: Makefile,v 1.20 2021/06/29 08:42:01 nia Exp $

DISTNAME=	numexpr-2.7.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=n/numexpr/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/pydata/numexpr
COMMENT=	Numerical expression evaluator for NumPy
LICENSE=	mit

USE_LANGUAGES=	c c++
REPLACE_PYTHON=	numexpr/cpuinfo.py

PYTHON_VERSIONS_INCOMPATIBLE+=	36	# py-numpy

do-test:
	${PYTHONBIN} -c "import numexpr; numexpr.test()"

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
