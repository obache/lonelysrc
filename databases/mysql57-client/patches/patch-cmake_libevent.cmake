$NetBSD$

--- cmake/libevent.cmake.orig	2020-09-23 12:00:04.000000000 +0000
+++ cmake/libevent.cmake
@@ -82,10 +82,18 @@ MACRO (FIND_SYSTEM_LIBEVENT)
   ## libevent_openssl.so is split out on Linux distros
   FIND_LIBRARY(LIBEVENT_OPENSSL event_openssl PATHS ${LIBEVENT_LIB_PATHS})
 
-  IF (LIBEVENT_CORE AND LIBEVENT_INCLUDE_DIRECTORY)
+  ## fail back to pre-split combined library
+  FIND_LIBRARY(LIBEVENT_COMBINED event PATHS ${LIBEVENT_LIB_PATHS})
+
+  IF ((LIBEVENT_CORE OR LIBEVENT_COMBINED) AND LIBEVENT_INCLUDE_DIRECTORY)
     SET(LIBEVENT_FOUND TRUE)
-    SET(LIBEVENT_LIBRARIES
-      ${LIBEVENT_CORE} ${LIBEVENT_EXTRA} ${LIBEVENT_OPENSSL})
+    IF (LIBEVENT_CORE)
+      SET(LIBEVENT_LIBRARIES
+        ${LIBEVENT_CORE} ${LIBEVENT_EXTRA} ${LIBEVENT_OPENSSL})
+    ELSE()
+      SET(LIBEVENT_LIBRARIES
+        ${LIBEVENT_COMBINED} ${LIBEVENT_OPENSSL})
+    ENDIF()
     SET(LIBEVENT_INCLUDE_DIRS ${LIBEVENT_INCLUDE_DIRECTORY})
     IF(NOT LIBEVENT_INCLUDE_DIRECTORY STREQUAL "/usr/include")
       MESSAGE(STATUS "LIBEVENT_INCLUDE_DIRS ${LIBEVENT_INCLUDE_DIRS}")
