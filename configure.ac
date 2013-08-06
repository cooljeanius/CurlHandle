dnl#                                               -*- Autoconf -*-
dnl# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([curlhandle],[3.3.1],[https://github.com/karelia/curlhandle/issues])
AC_CONFIG_SRCDIR([CURLHandleSource/ares_build-i386.h])
AC_CONFIG_HEADER([config.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([foreign 1.11 no-installinfo -Wall])
AM_MAINTAINER_MODE
AM_SANITY_CHECK
AC_SEARCH_LIBS([strerror],[cposix])dnl# This used to be AC_ISC_POSIX

# Checks for programs.
if test "x$CC" = "x"; then
	AM_PROG_CC_C_O
else
	test ! -z "$CC"
	AC_SUBST([CC])
fi
if test "x$CPP" = "x"; then
	XORG_PROG_RAWCPP
fi
AC_PROG_CXX
AC_PROG_OBJC
if test "x$MAKE" = "x"; then
	AC_PATH_PROG([MAKE],[make gmake gnumake])
	AC_PROG_MAKE_SET
fi
if test "x$INSTALL" = "x"; then
	test ! -z "$INSTALL"
	AC_PROG_INSTALL
fi
AC_PROG_LN_S
LT_INIT
if test "x$RANLIB" = "x"; then
	AC_PROG_RANLIB
else
	test ! -z "$RANLIB"
	AC_SUBST([RANLIB])
fi

# The "EBG_PROG_*" macros come from https://github.com/cooljeanius/MacOSXMacros
EBG_DEVELOPER_DIR
EBG_PROG_CLANG
EBG_PROG_DNSSD
EBG_PROG_IBTOOL
EBG_PROG_NMBLOOKUP
EBG_PROG_XCODEBUILD
MP_CHECK_FRAMEWORK_COREFOUNDATION
MP_CHECK_FRAMEWORK_SYSTEMCONFIGURATION
MP_CHECK_FRAMEWORK_IOKIT
AC_GET_MACOSX_VERSION

# From Bakefile
AC_BAKEFILE_PRECOMP_HEADERS

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lcurl':
AC_CHECK_LIB([curl],[main])
AX_LIB_CURL dnl# from the autoconf-archive package

# Checks for header files.
AC_CHECK_HEADERS([sys/socket.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T
AC_TYPE_UINT64_T

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_PROG_GCC_TRADITIONAL

AC_CONFIG_FILES([Makefile])
AC_CONFIG_SUBDIRS([c-ares curl])
AC_OUTPUT

