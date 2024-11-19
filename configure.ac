dnl#                                               -*- Autoconf -*-
dnl# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([curlhandle],[3.3.1],[https://github.com/karelia/curlhandle/issues])dnl
AC_CONFIG_SRCDIR([CURLHandleSource/ares_build-i386.h])dnl
AC_CONFIG_HEADERS([config.h])dnl
AC_CONFIG_AUX_DIR([build-aux])dnl
AC_CONFIG_MACRO_DIR([m4])dnl
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([foreign 1.11.6 no-installinfo -Wno-obsolete])dnl
AM_MAINTAINER_MODE
AM_SANITY_CHECK
AC_REQUIRE_AUX_FILE([depcomp])dnl
AC_SEARCH_LIBS([strerror],[cposix])dnl# This used to be AC\_ISC\_POSIX

# Checks for programs.
AC_PROG_AR
AS_IF([test "x${CC}" = "x"],[
  AM_PROG_CC_C_O
],[
  test -n "${CC}" && export CC
  AC_SUBST([CC])dnl
])dnl
  ## Preprocessor:
AS_IF([test "x${CPP}" = "x"],[
  XORG_PROG_RAWCPP
])dnl
AC_PROG_CXX
AC_PROG_OBJC
AS_IF([test "x${MAKE}" = "x"],[
  AC_PATH_PROG([MAKE],[make gmake gnumake])
  AC_PROG_MAKE_SET
])dnl
  ## Just in case not already checked:
AS_IF([test "x${INSTALL}" = "x"],[
  test -z "${INSTALL}" || unset INSTALL
  AC_PROG_INSTALL
])dnl
  ## (need whitespace)
AC_PROG_LN_S
LT_INIT
AS_IF([test "x${RANLIB}" = "x"],[
  AC_PROG_RANLIB
],[
  test -n "${RANLIB}" && export RANLIB
  AC_SUBST([RANLIB])dnl
])dnl

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
AC_CHECK_LIB([curl],[curl_easy_setopt])
AX_LIB_CURL dnl# from the autoconf-archive package

# Checks for header files.
AC_CHECK_HEADERS([sys/socket.h])dnl

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T
AC_TYPE_UINT64_T

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_CHECK_FUNCS([gcc_traditional_func])dnl

# Output.
AC_CONFIG_FILES([Makefile])
AC_CONFIG_SUBDIRS([c-ares curl])
AC_OUTPUT

