$NetBSD: patch-src_sshmasterconnection.cpp,v 1.1 2021/02/24 18:39:30 hauke Exp $

Add missing includes

--- src/sshmasterconnection.cpp.orig	2018-06-25 20:21:49 UTC
+++ src/sshmasterconnection.cpp
@@ -29,6 +29,9 @@
 #include <QDir>
 #include <QTemporaryFile>
 #ifndef Q_OS_WIN
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
 #include <arpa/inet.h>
 #endif
 #include <math.h>
