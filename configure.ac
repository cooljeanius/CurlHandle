#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.61)
AC_INIT(curlhandle, 3.3.1, https://github.com/karelia/curlhandle/issues)
AC_CONFIG_SRCDIR([CURLHandleSource/ares_build-i386.h])
AC_CONFIG_HEADER([config.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CANONICAL_HOST
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE
AM_SANITY_CHECK
AC_ISC_POSIX

# Checks for programs.
AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_OBJC
AC_PROG_MAKE_SET
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_RANLIB
LT_INIT

# The "EBG_PROG_*" macros come from https://github.com/cooljeanius/MacOSXMacros 
EBG_PROG_CLANG
EBG_PROG_IBTOOL
EBG_PROG_NIBTOOL
EBG_PROG_XCODEBUILD

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lcurl':
AC_CHECK_LIB([curl], [main])
AX_LIB_CURL # from the autoconf-archive package

# Checks for header files.
AC_HEADER_STDC
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
AC_CONFIG_SUBDIRS([c-ares
                   curl])
AC_OUTPUT

