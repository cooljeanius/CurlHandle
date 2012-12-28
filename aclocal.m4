# generated automatically by aclocal 1.10 -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004,
# 2005, 2006  Free Software Foundation, Inc.
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

m4_if(m4_PACKAGE_VERSION, [2.61],,
[m4_fatal([this file was generated for autoconf 2.61.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.], [63])])

dnl Checks for special options needed on MacOS X.
dnl Based on* part of Vim's configure.in file.
dnl *(By "based on" I mean "shamelessly stolen from")
dnl
dnl License: Whatever Vim's license is
dnl
dnl Usage: EBG_MACOSX_OPTIONS to include everything
dnl Usage: EBG_PROG_* to check for program *
dnl

AC_DEFUN([EBG_PROG_APPLESINGLE],
[
AC_PATH_PROG(APPLESINGLE, applesingle)
  if test "x$APPLESINGLE" != "x"; then
      AC_MSG_CHECKING(for applesingle version)
      APPLESINGLE_VERSION=`applesingle --version`
      AC_MSG_RESULT([$APPLESINGLE_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_CLANG],
[
AC_PATH_PROG(CLANG, clang)
  if test "x$CLANG" != "x"; then
      AC_MSG_CHECKING(for clang version)
      CLANG_VERSION=`clang --version`
      AC_MSG_RESULT([$CLANG_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_DNSSD],
[
AC_PATH_PROG(DNSSD, dns-sd)
  if test "x$DNSSD" != "x"; then
      AC_MSG_CHECKING(for dns-sd version)
      DNSSD_VERSION=`dns-sd -V`
      AC_MSG_RESULT([$DNSSD_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_HDIUTIL],
[
AC_PATH_PROG(HDIUTIL, hdiutil)
  if test "x$HDIUTIL" != "x"; then
      AC_MSG_CHECKING(hdiutil info)
      HDIUTIL_INFO=`hdiutil info`
      printf "\n"
      AC_MSG_RESULT([$HDIUTIL_INFO])
  fi
])

AC_DEFUN([EBG_PROG_IBTOOL],
[
AC_PATH_PROG(IBTOOL, ibtool)
  if test "x$IBTOOL" != "x"; then
      AC_MSG_CHECKING(for ibtool version)
      IBTOOL_VERSION=`ibtool --version`
      printf "\n"
      AC_MSG_RESULT([$IBTOOL_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_MACBINARY],
[
AC_PATH_PROG(MACBINARY, macbinary)
  if test "x$MACBINARY" != "x"; then
      AC_MSG_CHECKING(for macbinary version)
      MACBINARY_VERSION=`macbinary --version`
      AC_MSG_RESULT([$MACBINARY_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_MACHINE],
[
AC_PATH_PROG(MACHINE, machine)
  if test "x$MACHINE" != "x"; then
      AC_MSG_CHECKING(machine type)
      MACHINE_TYPE=`machine`
      AC_MSG_RESULT([$MACHINE_TYPE])
  fi
])

AC_DEFUN([EBG_PROG_NIBTOOL],
[
AC_PATH_PROG(NIBTOOL, nibtool)
  if test "x$NIBTOOL" != "x"; then
      AC_MSG_CHECKING(for nibtool version)
      NIBTOOL_VERSION=`nibtool --version`
      AC_MSG_RESULT([$NIBTOOL_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_NMBLOOKUP],
[
AC_PATH_PROG(NMBLOOKUP, nmblookup)
  if test "x$NMBLOOKUP" != "x"; then
      AC_MSG_CHECKING(for nmblookup version)
      NMBLOOKUP_VERSION=`nmblookup --version`
      AC_MSG_RESULT([$NMBLOOKUP_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_OSALANG],
[
AC_PATH_PROG(OSALANG, osalang)
  if test "x$OSALANG" != "x"; then
      AC_MSG_CHECKING(for available OSA languages)
      OSA_LANGUAGES=`osalang`
      printf "\n"
      AC_MSG_RESULT([$OSA_LANGUAGES])
  fi
])

AC_DEFUN([EBG_PROG_SHARK],
[
AC_PATH_PROG(SHARK, shark)
  if test "x$SHARK" != "x"; then
      AC_MSG_CHECKING(for shark version)
      SHARK_VERSION=`shark -v`
      AC_MSG_RESULT([$SHARK_VERSION])
  fi
])

AC_DEFUN([EBG_PROG_XCODEBUILD],
[
AC_PATH_PROG(XCODEBUILD, xcodebuild)
  if test "x$XCODEBUILD" != "x"; then
      AC_MSG_CHECKING(for Xcode version)
      XCODEBUILD_VERSION=`xcodebuild -version`
      AC_MSG_RESULT([$XCODEBUILD_VERSION])
  fi
  if test "x$XCODEBUILD" != "x"; then
      AC_MSG_CHECKING(for available Xcode sdks)
      XCODE_SDKS=`xcodebuild -showsdks | grep sdk | cut -d\  -f1,2,3,4`
      printf "\n The available Xcode sdks are: \n"
      AC_MSG_RESULT([$XCODE_SDKS])
  fi
])

AC_DEFUN([EBG_PROG_XED],
[
AC_PATH_PROG(XED, xed)
  if test "x$XED" != "x"; then
      AC_MSG_CHECKING(for xed version)
      XED_VERSION=`xed --version`
      AC_MSG_RESULT([$XED_VERSION])
  fi
])

dnl
dnl Now that we have all the sub-macros out of the way, it's time for the main one
dnl
AC_DEFUN([EBG_MACOSX_OPTIONS],
[
AC_MSG_CHECKING([for Darwin (Mac OS X)])
if test "`(uname) 2>/dev/null`" = Darwin; then
  AC_MSG_RESULT(yes)

  AC_MSG_CHECKING(--disable-darwin argument)
  AC_ARG_ENABLE(darwin,
	  [  --disable-darwin        Disable Darwin (Mac OS X) support.],
	  , [enable_darwin="yes"])
  if test "$enable_darwin" = "yes"; then
    AC_MSG_RESULT(no)
  else
    AC_MSG_RESULT([yes, Darwin support excluded])
  fi

  AC_MSG_CHECKING(--with-mac-arch argument)
  AC_ARG_WITH(mac-arch, [  --with-mac-arch=ARCH    current, intel, ppc or both],
	MACARCH="$withval"; AC_MSG_RESULT($MACARCH),
	MACARCH="current"; AC_MSG_RESULT(defaulting to $MACARCH))

  AC_MSG_CHECKING(--with-developer-dir argument)
  AC_ARG_WITH(developer-dir, [  --with-developer-dir=PATH    use PATH as location for Xcode developer tools],
	DEVELOPER_DIR="$withval"; AC_MSG_RESULT($DEVELOPER_DIR),
        DEVELOPER_DIR=""; AC_MSG_RESULT(not present))
  
  if test "x$DEVELOPER_DIR" = "x"; then
    AC_PATH_PROG(XCODE_SELECT, xcode-select)
    if test "x$XCODE_SELECT" != "x"; then
      AC_MSG_CHECKING(for developer dir using xcode-select)
      DEVELOPER_DIR=`$XCODE_SELECT -print-path`
      AC_MSG_RESULT([$DEVELOPER_DIR])
    else
      DEVELOPER_DIR=/Developer
    fi
  fi
  
  AC_PATH_PROG(AGVTOOL, agvtool)
  AC_PATH_PROG(APPLEPING, appleping)
  EBG_PROG_APPLESINGLE
  AC_PATH_PROG(AUTOMATOR, automator)
  AC_PATH_PROG(AUVAL, auval)
  AC_PATH_PROG(AUVALTOOL, auvaltool)
  AC_PATH_PROG(BUILD_STRINGS, BuildStrings)
  AC_PATH_PROG(CF_INFO_PLIST_CONVERTER, CFInfoPlistConverter)
  EBG_PROG_CLANG
  AC_PATH_PROG(CMPDYLIB, cmpdylib)
  AC_PATH_PROG(CODESIGN, codesign)
  AC_PATH_PROG(CODESIGN_ALLOCATE, codesign_allocate)
  AC_PATH_PROG(CODESIGN_WRAPPER, codesign_wrapper)
  AC_PATH_PROG(CPMAC, CpMac)
  AC_PATH_PROG(DEFAULTS, defaults)
  AC_PATH_PROG(DEREZ, DeRez)
  AC_PATH_PROG(DEV_TOOLS_SECURITY, DevToolsSecurity)
  AC_PATH_PROG(DISTCC, distcc)
  AC_PATH_PROG(DISTCCD, distccd)
  AC_PATH_PROG(DISTCCMON_TEXT, distccmon-text)
  EBG_PROG_DNSSD
  AC_PATH_PROG(DOCSETUTIL, docsetutil)
  AC_PATH_PROG(DSCACHEUTIL, dscacheutil)
  AC_PATH_PROG(DSCL, dscl)
  AC_PATH_PROG(DSERR, dserr)
  AC_PATH_PROG(DSEXPORT, dsexport)
  AC_PATH_PROG(DSIMPORT, dsimport)
  AC_PATH_PROG(DSMEMBERUTIL, dsmemberutil)
  AC_PATH_PROG(DSPERFMONITOR, dsperfmonitor)
  AC_PATH_PROG(DTRUSS, dtruss)
  AC_PATH_PROG(GATHERHEADERDOC, gatherheaderdoc)
  AC_PATH_PROG(GEN_BRIDGE_METADATA, gen_bridge_metadata)
  AC_PATH_PROG(GET_FILE_INFO, GetFileInfo)
  AC_PATH_PROG(HDXML2MANXML, hdxml2manxml)
  EBG_PROG_HDIUTIL
  AC_PATH_PROG(HIUTIL, hiutil)
  AC_PATH_PROG(HEADERDOC2HTML, headerdoc2html)
  AC_PATH_PROG(HWPREFS, hwprefs)
  EBG_PROG_IBTOOL
  AC_PATH_PROG(IMAGE_UNIT_ANALYZER, ImageUnitAnalyzer)
  AC_PATH_PROG(INSTRUMENTS, instruments)
  AC_PATH_PROG(IPHONEOS_OPTIMIZE, iphoneos-optimize)
  AC_PATH_PROG(LD_CLASSIC, ld_classic)
  AC_PATH_PROG(LD64, ld64)
  AC_PATH_PROG(LEAKS, leaks)
  AC_PATH_PROG(LSDISTCC, lsdistcc)
  AC_PATH_PROG(LSMAC, lsmac)
  EBG_PROG_MACBINARY
  AC_PATH_PROG(MDCHECKSCHEMA, mdcheckschema)
  AC_PATH_PROG(MERGE_PEF, MergePef)
  AC_PATH_PROG(MIG, mig)
  AC_PATH_PROG(MKSDK, mksdk)
  AC_PATH_PROG(MOMC, momc)
  AC_PATH_PROG(MVMAC, MvMac)
  EBG_PROG_NIBTOOL
  AC_PATH_PROG(NIUTIL, niutil)
  EBG_PROG_NMBLOOKUP
  AC_PATH_PROG(OPEN, open)
  AC_PATH_PROG(OSACOMPILE, osacompile)
  AC_PATH_PROG(OSADECOMPILE, osadecompile)
  EBG_PROG_OSALANG
  AC_PATH_PROG(OSASCRIPT, osascript)
  AC_PATH_PROG(PACKAGE_APPLICATION, PackageApplication)
  AC_PATH_PROG(PACKAGEMAKER, packagemaker)
  AC_PATH_PROG(PBCOPY, pbcopy)
  AC_PATH_PROG(PBPASTE, pbpaste)
  AC_PATH_PROG(PBHELPINDEXER, pbhelpindexer)
  AC_PATH_PROG(PBPROJECTDUMP, pbprojectdump)
  AC_PATH_PROG(PBUTIL, pbutil)
  AC_PATH_PROG(PBXCP, pbxcp)
  AC_PATH_PROG(PBXHMAPDUMP, pbxhmapdump)
  AC_PATH_PROG(PKGBUILD, pkgbuild)
  AC_PATH_PROG(PLUTIL, plutil)
  AC_PATH_PROG(PPCEXPLAIN, PPCExplain)
  AC_PATH_PROG(PROJECT_INFO, projectInfo)
  AC_PATH_PROG(PUMP, pump)
  AC_PATH_PROG(PURGE, purge)
  AC_PATH_PROG(PWPOLICY, pwpolicy)
  AC_PATH_PROG(QLMANAGE, qlmanage)
  AC_PATH_PROG(QUARTZ_WM, quartz-wm)
  AC_PATH_PROG(REDO_PREBINDING, redo_prebinding)
  AC_PATH_PROG(RESMERGER, ResMerger)
  AC_PATH_PROG(REZ, Rez)
  AC_PATH_PROG(REZDET, RezDet)
  AC_PATH_PROG(REZWACK, RezWack)
  AC_PATH_PROG(RSA_SECURID_GETPASSWD, RSA_SecurID_getpasswd)
  AC_PATH_PROG(RUN_PLATFORM_UNIT_TESTS, RunPlatformUnitTests)
  AC_PATH_PROG(RUN_TARGET_UNIT_TESTS, RunTargetUnitTests)
  AC_PATH_PROG(RUN_UNIT_TESTS, RunUnitTests)
  AC_PATH_PROG(SAMPLE, sample)
  AC_PATH_PROG(SANDBOX_EXEC, sandbox-exec)
  AC_PATH_PROG(SANDBOX_simplify, sandbox-simplify)
  AC_PATH_PROG(SAY, say)
  AC_PATH_PROG(SDEF, sdef)
  AC_PATH_PROG(SDP, sdp)
  AC_PATH_PROG(SECURITY, Security)
  AC_PATH_PROG(SET_FILE, SetFile)
  EBG_PROG_SHARK
  AC_PATH_PROG(SPLIT_FORKS, SplitForks)
  AC_PATH_PROG(TEXTURETOOL, texturetool)
  AC_PATH_PROG(UNREZWACK, UnRezWack)
  AC_PATH_PROG(UPDATE_DYLD_SHARED_CACHE, update_dyld_shared_cache)
  AC_PATH_PROG(USERS, users)
  AC_PATH_PROG(VERS_STRING, vers_string)
  AC_PATH_PROG(WSMAKE_STUBS, WSMakeStubs)
  AC_PATH_PROG(XATTR, xattr)
  AC_PATH_PROG(XCMAN, xcman)
  AC_PATH_PROG(XCODE_DISTCC_RULE_INSTALLER, Xcode_distcc_rule_installer)
  EBG_PROG_XCODEBUILD
  AC_PATH_PROG(XCODEINDEX, xcodeindex)
  AC_PATH_PROG(XCRUN, xcrun)
  EBG_PROG_XED
  AC_PATH_PROG(XGRID, xgrid)

  if test "x$MACARCH" = "xboth"; then
    AC_MSG_CHECKING(specifically for 10.4 universal SDK)
    dnl There is a terrible inconsistency (but we appear to get away with it):
    dnl $CFLAGS uses the 10.4u SDK library for the headers, while $CPPFLAGS
    dnl doesn't, because "gcc -E" doesn't grok it.  That means the configure
    dnl tests using the preprocessor are actually done with the wrong header
    dnl files. $LDFLAGS is set at the end, because configure uses it together
    dnl with $CFLAGS and we can only have one -sysroot argument.
    save_cppflags="$CPPFLAGS"
    save_cflags="$CFLAGS"
    save_ldflags="$LDFLAGS"
    CFLAGS="$CFLAGS -isysroot $DEVELOPER_DIR/SDKs/MacOSX10.4u.sdk -arch i386 -arch ppc"
    AC_TRY_LINK([ ], [ ],
	AC_MSG_RESULT(found, will make universal binary),

	AC_MSG_RESULT(not found)
	CFLAGS="$save_cflags"
	AC_MSG_CHECKING(if Intel architecture is supported)
	CPPFLAGS="$CPPFLAGS -arch i386"
	LDFLAGS="$save_ldflags -arch i386"
	AC_TRY_LINK([ ], [ ],
	    AC_MSG_RESULT(yes); MACARCH="intel",
	    AC_MSG_RESULT(no, using PowerPC)
		MACARCH="ppc"
		CPPFLAGS="$save_cppflags -arch ppc"
		LDFLAGS="$save_ldflags -arch ppc"))
  elif test "x$MACARCH" = "xintel"; then
    CPPFLAGS="$CPPFLAGS -arch intel"
    LDFLAGS="$LDFLAGS -arch intel"
  elif test "x$MACARCH" = "xppc"; then
    CPPFLAGS="$CPPFLAGS -arch ppc"
    LDFLAGS="$LDFLAGS -arch ppc"
  fi

  if test "$enable_darwin" = "yes"; then
    MACOSX=yes
    dnl TODO: use -arch i386 on Intel machines
    CPPFLAGS="$CPPFLAGS -DMACOS_X_UNIX -no-cpp-precomp"
    AC_CHECK_HEADER(Carbon/Carbon.h, CARBON=yes)
  fi

  dnl Avoid a bug with -O2 with gcc 4.0.1.  Symptom: malloc() reports double
  dnl free.  This happens in expand_filename(), because the optimizer swaps
  dnl two blocks of code, both using "repl", that can't be swapped.
  if test "$MACARCH" = "intel" -o "$MACARCH" = "both"; then
    CFLAGS=`echo "$CFLAGS" | sed 's/-O[[23456789]]/-Oz/'`
  fi

else
  AC_MSG_RESULT(no)
fi
])

# ===========================================================================
#    http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_COMPARE_VERSION(VERSION_A, OP, VERSION_B, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
#
# DESCRIPTION
#
#   This macro compares two version strings. Due to the various number of
#   minor-version numbers that can exist, and the fact that string
#   comparisons are not compatible with numeric comparisons, this is not
#   necessarily trivial to do in a autoconf script. This macro makes doing
#   these comparisons easy.
#
#   The six basic comparisons are available, as well as checking equality
#   limited to a certain number of minor-version levels.
#
#   The operator OP determines what type of comparison to do, and can be one
#   of:
#
#    eq  - equal (test A == B)
#    ne  - not equal (test A != B)
#    le  - less than or equal (test A <= B)
#    ge  - greater than or equal (test A >= B)
#    lt  - less than (test A < B)
#    gt  - greater than (test A > B)
#
#   Additionally, the eq and ne operator can have a number after it to limit
#   the test to that number of minor versions.
#
#    eq0 - equal up to the length of the shorter version
#    ne0 - not equal up to the length of the shorter version
#    eqN - equal up to N sub-version levels
#    neN - not equal up to N sub-version levels
#
#   When the condition is true, shell commands ACTION-IF-TRUE are run,
#   otherwise shell commands ACTION-IF-FALSE are run. The environment
#   variable 'ax_compare_version' is always set to either 'true' or 'false'
#   as well.
#
#   Examples:
#
#     AX_COMPARE_VERSION([3.15.7],[lt],[3.15.8])
#     AX_COMPARE_VERSION([3.15],[lt],[3.15.8])
#
#   would both be true.
#
#     AX_COMPARE_VERSION([3.15.7],[eq],[3.15.8])
#     AX_COMPARE_VERSION([3.15],[gt],[3.15.8])
#
#   would both be false.
#
#     AX_COMPARE_VERSION([3.15.7],[eq2],[3.15.8])
#
#   would be true because it is only comparing two minor versions.
#
#     AX_COMPARE_VERSION([3.15.7],[eq0],[3.15])
#
#   would be true because it is only comparing the lesser number of minor
#   versions of the two values.
#
#   Note: The characters that separate the version numbers do not matter. An
#   empty string is the same as version 0. OP is evaluated by autoconf, not
#   configure, so must be a string, not a variable.
#
#   The author would like to acknowledge Guido Draheim whose advice about
#   the m4_case and m4_ifvaln functions make this macro only include the
#   portions necessary to perform the specific comparison specified by the
#   OP argument in the final configure script.
#
# LICENSE
#
#   Copyright (c) 2008 Tim Toolan <toolan@ele.uri.edu>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 11

dnl #########################################################################
AC_DEFUN([AX_COMPARE_VERSION], [
  AC_REQUIRE([AC_PROG_AWK])

  # Used to indicate true or false condition
  ax_compare_version=false

  # Convert the two version strings to be compared into a format that
  # allows a simple string comparison.  The end result is that a version
  # string of the form 1.12.5-r617 will be converted to the form
  # 0001001200050617.  In other words, each number is zero padded to four
  # digits, and non digits are removed.
  AS_VAR_PUSHDEF([A],[ax_compare_version_A])
  A=`echo "$1" | sed -e 's/\([[0-9]]*\)/Z\1Z/g' \
                     -e 's/Z\([[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/Z\([[0-9]][[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/Z\([[0-9]][[0-9]][[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/[[^0-9]]//g'`

  AS_VAR_PUSHDEF([B],[ax_compare_version_B])
  B=`echo "$3" | sed -e 's/\([[0-9]]*\)/Z\1Z/g' \
                     -e 's/Z\([[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/Z\([[0-9]][[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/Z\([[0-9]][[0-9]][[0-9]]\)Z/Z0\1Z/g' \
                     -e 's/[[^0-9]]//g'`

  dnl # In the case of le, ge, lt, and gt, the strings are sorted as necessary
  dnl # then the first line is used to determine if the condition is true.
  dnl # The sed right after the echo is to remove any indented white space.
  m4_case(m4_tolower($2),
  [lt],[
    ax_compare_version=`echo "x$A
x$B" | sed 's/^ *//' | sort -r | sed "s/x${A}/false/;s/x${B}/true/;1q"`
  ],
  [gt],[
    ax_compare_version=`echo "x$A
x$B" | sed 's/^ *//' | sort | sed "s/x${A}/false/;s/x${B}/true/;1q"`
  ],
  [le],[
    ax_compare_version=`echo "x$A
x$B" | sed 's/^ *//' | sort | sed "s/x${A}/true/;s/x${B}/false/;1q"`
  ],
  [ge],[
    ax_compare_version=`echo "x$A
x$B" | sed 's/^ *//' | sort -r | sed "s/x${A}/true/;s/x${B}/false/;1q"`
  ],[
    dnl Split the operator from the subversion count if present.
    m4_bmatch(m4_substr($2,2),
    [0],[
      # A count of zero means use the length of the shorter version.
      # Determine the number of characters in A and B.
      ax_compare_version_len_A=`echo "$A" | $AWK '{print(length)}'`
      ax_compare_version_len_B=`echo "$B" | $AWK '{print(length)}'`

      # Set A to no more than B's length and B to no more than A's length.
      A=`echo "$A" | sed "s/\(.\{$ax_compare_version_len_B\}\).*/\1/"`
      B=`echo "$B" | sed "s/\(.\{$ax_compare_version_len_A\}\).*/\1/"`
    ],
    [[0-9]+],[
      # A count greater than zero means use only that many subversions
      A=`echo "$A" | sed "s/\(\([[0-9]]\{4\}\)\{m4_substr($2,2)\}\).*/\1/"`
      B=`echo "$B" | sed "s/\(\([[0-9]]\{4\}\)\{m4_substr($2,2)\}\).*/\1/"`
    ],
    [.+],[
      AC_WARNING(
        [illegal OP numeric parameter: $2])
    ],[])

    # Pad zeros at end of numbers to make same length.
    ax_compare_version_tmp_A="$A`echo $B | sed 's/./0/g'`"
    B="$B`echo $A | sed 's/./0/g'`"
    A="$ax_compare_version_tmp_A"

    # Check for equality or inequality as necessary.
    m4_case(m4_tolower(m4_substr($2,0,2)),
    [eq],[
      test "x$A" = "x$B" && ax_compare_version=true
    ],
    [ne],[
      test "x$A" != "x$B" && ax_compare_version=true
    ],[
      AC_WARNING([illegal OP parameter: $2])
    ])
  ])

  AS_VAR_POPDEF([A])dnl
  AS_VAR_POPDEF([B])dnl

  dnl # Execute ACTION-IF-TRUE / ACTION-IF-FALSE.
  if test "$ax_compare_version" = "true" ; then
    m4_ifvaln([$4],[$4],[:])dnl
    m4_ifvaln([$5],[else $5])dnl
  fi
]) dnl AX_COMPARE_VERSION

# ===========================================================================
#        http://www.gnu.org/software/autoconf-archive/ax_lib_curl.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_LIB_CURL([VERSION],[ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Checks for minimum curl library version VERSION. If successfull executes
#   ACTION-IF-SUCCESS otherwise ACTION-IF-FAILURE.
#
#   Defines CURL_LIBS and CURL_CFLAGS.
#
#   A simple example:
#
#     AX_LIB_CURL([7.19.4],,[
#       AC_MSG_ERROR([Your system lacks of libcurl >= 7.19.4])
#     ])
#
#   This macro is a rearranged version of AC_LIB_CURL from Akos Maroy.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 7

AU_ALIAS([AC_CHECK_CURL], [AX_LIB_CURL])
AC_DEFUN([AX_LIB_CURL], [
  AX_PATH_GENERIC([curl],[$1],'s/^libcurl\ \+//',[$2],[$3])
])

# ===========================================================================
#      http://www.gnu.org/software/autoconf-archive/ax_path_generic.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_PATH_GENERIC(LIBRARY,[MINIMUM-VERSION,[SED-EXPR-EXTRACTOR]],[ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND],[CONFIG-SCRIPTS],[CFLAGS-ARG],[LIBS-ARG])
#
# DESCRIPTION
#
#   Runs the LIBRARY-config script and defines LIBRARY_CFLAGS and
#   LIBRARY_LIBS unless the user had predefined them in the environment.
#
#   The script must support `--cflags' and `--libs' args. If MINIMUM-VERSION
#   is specified, the script must also support the `--version' arg. If the
#   `--with-library-[exec-]prefix' arguments to ./configure are given, it
#   must also support `--prefix' and `--exec-prefix'. Prefereable use
#   CONFIG-SCRIPTS as config script, CFLAGS-ARG instead of `--cflags` and
#   LIBS-ARG instead of `--libs`, if given.
#
#   The SED-EXPR-EXTRACTOR parameter representes the expression used in sed
#   to extract the version number. Use it if your 'foo-config --version'
#   dumps something like 'Foo library v1.0.0 (alfa)' instead of '1.0.0'.
#
#   The macro respects LIBRARY_CONFIG, LIBRARY_CFLAGS and LIBRARY_LIBS
#   variables. If the first one is defined, it specifies the name of the
#   config script to use. If the latter two are defined, the script is not
#   ran at all and their values are used instead (if only one of them is
#   defined, the empty value of the remaining one is still used).
#
#   Example:
#
#     AX_PATH_GENERIC(Foo, 1.0.0)
#
#   would run `foo-config --version' and check that it is at least 1.0.0, if
#   successful the following variables would be defined and substituted:
#
#     FOO_CFLAGS to `foo-config --cflags`
#     FOO_LIBS   to `foo-config --libs`
#
#   Example:
#
#     AX_PATH_GENERIC([Bar],,,[
#        AC_MSG_ERROR([Cannot find Bar library])
#     ])
#
#   would check for bar-config program, defining and substituting the
#   following variables:
#
#     BAR_CFLAGS to `bar-config --cflags`
#     BAR_LIBS   to `bar-config --libs`
#
#   Example:
#
#     ./configure BAZ_LIBS=/usr/lib/libbaz.a
#
#   would link with a static version of baz library even if `baz-config
#   --libs` returns just "-lbaz" that would normally result in using the
#   shared library.
#
#   This macro is a rearranged version of AC_PATH_GENERIC from Angus Lees.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 11

AU_ALIAS([AC_PATH_GENERIC], [AX_PATH_GENERIC])
AC_DEFUN([AX_PATH_GENERIC],[
  AC_REQUIRE([AC_PROG_SED])

  dnl we're going to need uppercase and lowercase versions of the
  dnl string `LIBRARY'
  pushdef([UP],   translit([$1], [a-z], [A-Z]))dnl
  pushdef([DOWN], translit([$1], [A-Z], [a-z]))dnl

  AC_ARG_WITH(DOWN-prefix,[AS_HELP_STRING([--with-]DOWN[-prefix=PREFIX], [Prefix where $1 is installed (optional)])],
    DOWN[]_config_prefix="$withval", DOWN[]_config_prefix="")
  AC_ARG_WITH(DOWN-exec-prefix,[AS_HELP_STRING([--with-]DOWN[-exec-prefix=EPREFIX], [Exec prefix where $1 is installed (optional)])],
    DOWN[]_config_exec_prefix="$withval", DOWN[]_config_exec_prefix="")

  AC_ARG_VAR(UP[]_CONFIG, [config script used for $1])
  AC_ARG_VAR(UP[]_CFLAGS, [CFLAGS used for $1])
  AC_ARG_VAR(UP[]_LIBS,   [LIBS used for $1])

  AS_IF([test x$UP[]_CFLAGS != x -o x$UP[]_LIBS != x],[
    dnl Don't run config script at all, use user-provided values instead.
    AC_SUBST(UP[]_CFLAGS)
    AC_SUBST(UP[]_LIBS)
    :
    $4
  ],[
    AS_IF([test x$DOWN[]_config_exec_prefix != x],[
      DOWN[]_config_args="$DOWN[]_config_args --exec-prefix=$DOWN[]_config_exec_prefix"
      AS_IF([test x${UP[]_CONFIG+set} != xset],[
	UP[]_CONFIG=$DOWN[]_config_exec_prefix/bin/DOWN-config
      ])
    ])
    AS_IF([test x$DOWN[]_config_prefix != x],[
      DOWN[]_config_args="$DOWN[]_config_args --prefix=$DOWN[]_config_prefix"
      AS_IF([test x${UP[]_CONFIG+set} != xset],[
	UP[]_CONFIG=$DOWN[]_config_prefix/bin/DOWN-config
      ])
    ])

    AC_PATH_PROGS(UP[]_CONFIG,[$6 DOWN-config],[no])
    AS_IF([test "$UP[]_CONFIG" == "no"],[
      :
      $5
    ],[
      dnl Get the CFLAGS from LIBRARY-config script
      AS_IF([test x"$7" == x],[
	UP[]_CFLAGS="`$UP[]_CONFIG $DOWN[]_config_args --cflags`"
      ],[
	UP[]_CFLAGS="`$UP[]_CONFIG $DOWN[]_config_args $7`"
      ])

      dnl Get the LIBS from LIBRARY-config script
      AS_IF([test x"$8" == x],[
	UP[]_LIBS="`$UP[]_CONFIG $DOWN[]_config_args --libs`"
      ],[
	UP[]_LIBS="`$UP[]_CONFIG $DOWN[]_config_args $8`"
      ])

      AS_IF([test x"$2" != x],[
	dnl Check for provided library version
	AS_IF([test x"$3" != x],[
	  dnl Use provided sed expression
	  DOWN[]_version="`$UP[]_CONFIG $DOWN[]_config_args --version | $SED -e $3`"
	],[
	  DOWN[]_version="`$UP[]_CONFIG $DOWN[]_config_args --version | $SED -e 's/^\ *\(.*\)\ *$/\1/'`"
	])

	AC_MSG_CHECKING([for $1 ($DOWN[]_version) >= $2])
	AX_COMPARE_VERSION($DOWN[]_version,[ge],[$2],[
	  AC_MSG_RESULT([yes])

	  AC_SUBST(UP[]_CFLAGS)
	  AC_SUBST(UP[]_LIBS)
	  :
	  $4
	],[
	  AC_MSG_RESULT([no])
	  :
	  $5
	])
      ],[
	AC_SUBST(UP[]_CFLAGS)
	AC_SUBST(UP[]_LIBS)
	:
	$4
      ])
    ])
  ])

  popdef([UP])
  popdef([DOWN])
])

# Copyright (C) 2002, 2003, 2005, 2006  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_AUTOMAKE_VERSION(VERSION)
# ----------------------------
# Automake X.Y traces this macro to ensure aclocal.m4 has been
# generated from the m4 files accompanying Automake X.Y.
# (This private macro should not be called outside this file.)
AC_DEFUN([AM_AUTOMAKE_VERSION],
[am__api_version='1.10'
dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
dnl require some minimum version.  Point them to the right macro.
m4_if([$1], [1.10], [],
      [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
])

# _AM_AUTOCONF_VERSION(VERSION)
# -----------------------------
# aclocal traces this macro to find the Autoconf version.
# This is a private macro too.  Using m4_define simplifies
# the logic in aclocal, which can simply ignore this definition.
m4_define([_AM_AUTOCONF_VERSION], [])

# AM_SET_CURRENT_AUTOMAKE_VERSION
# -------------------------------
# Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
# This function is AC_REQUIREd by AC_INIT_AUTOMAKE.
AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
[AM_AUTOMAKE_VERSION([1.10])dnl
_AM_AUTOCONF_VERSION(m4_PACKAGE_VERSION)])

# AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-

# Copyright (C) 2001, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
# $ac_aux_dir to `$srcdir/foo'.  In other projects, it is set to
# `$srcdir', `$srcdir/..', or `$srcdir/../..'.
#
# Of course, Automake must honor this variable whenever it calls a
# tool from the auxiliary directory.  The problem is that $srcdir (and
# therefore $ac_aux_dir as well) can be either absolute or relative,
# depending on how configure is run.  This is pretty annoying, since
# it makes $ac_aux_dir quite unusable in subdirectories: in the top
# source directory, any form will work fine, but in subdirectories a
# relative path needs to be adjusted first.
#
# $ac_aux_dir/missing
#    fails when called from a subdirectory if $ac_aux_dir is relative
# $top_srcdir/$ac_aux_dir/missing
#    fails if $ac_aux_dir is absolute,
#    fails when called from a subdirectory in a VPATH build with
#          a relative $ac_aux_dir
#
# The reason of the latter failure is that $top_srcdir and $ac_aux_dir
# are both prefixed by $srcdir.  In an in-source build this is usually
# harmless because $srcdir is `.', but things will broke when you
# start a VPATH build or use an absolute $srcdir.
#
# So we could use something similar to $top_srcdir/$ac_aux_dir/missing,
# iff we strip the leading $srcdir from $ac_aux_dir.  That would be:
#   am_aux_dir='\$(top_srcdir)/'`expr "$ac_aux_dir" : "$srcdir//*\(.*\)"`
# and then we would define $MISSING as
#   MISSING="\${SHELL} $am_aux_dir/missing"
# This will work as long as MISSING is not called from configure, because
# unfortunately $(top_srcdir) has no meaning in configure.
# However there are other variables, like CC, which are often used in
# configure, and could therefore not use this "fixed" $ac_aux_dir.
#
# Another solution, used here, is to always expand $ac_aux_dir to an
# absolute PATH.  The drawback is that using absolute paths prevent a
# configured tree to be moved without reconfiguration.

AC_DEFUN([AM_AUX_DIR_EXPAND],
[dnl Rely on autoconf to set up CDPATH properly.
AC_PREREQ([2.50])dnl
# expand $ac_aux_dir to an absolute path
am_aux_dir=`cd $ac_aux_dir && pwd`
])

# AM_CONDITIONAL                                            -*- Autoconf -*-

# Copyright (C) 1997, 2000, 2001, 2003, 2004, 2005, 2006
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 8

# AM_CONDITIONAL(NAME, SHELL-CONDITION)
# -------------------------------------
# Define a conditional.
AC_DEFUN([AM_CONDITIONAL],
[AC_PREREQ(2.52)dnl
 ifelse([$1], [TRUE],  [AC_FATAL([$0: invalid condition: $1])],
	[$1], [FALSE], [AC_FATAL([$0: invalid condition: $1])])dnl
AC_SUBST([$1_TRUE])dnl
AC_SUBST([$1_FALSE])dnl
_AM_SUBST_NOTMAKE([$1_TRUE])dnl
_AM_SUBST_NOTMAKE([$1_FALSE])dnl
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi
AC_CONFIG_COMMANDS_PRE(
[if test -z "${$1_TRUE}" && test -z "${$1_FALSE}"; then
  AC_MSG_ERROR([[conditional "$1" was never defined.
Usually this means the macro was only invoked conditionally.]])
fi])])

# Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 9

# There are a few dirty hacks below to avoid letting `AC_PROG_CC' be
# written in clear, in which case automake, when reading aclocal.m4,
# will think it sees a *use*, and therefore will trigger all it's
# C support machinery.  Also note that it means that autoscan, seeing
# CC etc. in the Makefile, will ask for an AC_PROG_CC use...


# _AM_DEPENDENCIES(NAME)
# ----------------------
# See how the compiler implements dependency checking.
# NAME is "CC", "CXX", "GCJ", or "OBJC".
# We try a few techniques and use that to set a single cache variable.
#
# We don't AC_REQUIRE the corresponding AC_PROG_CC since the latter was
# modified to invoke _AM_DEPENDENCIES(CC); we would have a circular
# dependency, and given that the user is not expected to run this macro,
# just rely on AC_PROG_CC.
AC_DEFUN([_AM_DEPENDENCIES],
[AC_REQUIRE([AM_SET_DEPDIR])dnl
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])dnl
AC_REQUIRE([AM_MAKE_INCLUDE])dnl
AC_REQUIRE([AM_DEP_TRACK])dnl

ifelse([$1], CC,   [depcc="$CC"   am_compiler_list=],
       [$1], CXX,  [depcc="$CXX"  am_compiler_list=],
       [$1], OBJC, [depcc="$OBJC" am_compiler_list='gcc3 gcc'],
       [$1], UPC,  [depcc="$UPC"  am_compiler_list=],
       [$1], GCJ,  [depcc="$GCJ"  am_compiler_list='gcc3 gcc'],
                   [depcc="$$1"   am_compiler_list=])

AC_CACHE_CHECK([dependency style of $depcc],
               [am_cv_$1_dependencies_compiler_type],
[if test -z "$AMDEP_TRUE" && test -f "$am_depcomp"; then
  # We make a subdir and do the tests there.  Otherwise we can end up
  # making bogus files that we don't know about and never remove.  For
  # instance it was reported that on HP-UX the gcc test will end up
  # making a dummy file named `D' -- because `-MD' means `put the output
  # in D'.
  mkdir conftest.dir
  # Copy depcomp to subdir because otherwise we won't find it if we're
  # using a relative directory.
  cp "$am_depcomp" conftest.dir
  cd conftest.dir
  # We will build objects and dependencies in a subdirectory because
  # it helps to detect inapplicable dependency modes.  For instance
  # both Tru64's cc and ICC support -MD to output dependencies as a
  # side effect of compilation, but ICC will put the dependencies in
  # the current directory while Tru64 will put them in the object
  # directory.
  mkdir sub

  am_cv_$1_dependencies_compiler_type=none
  if test "$am_compiler_list" = ""; then
     am_compiler_list=`sed -n ['s/^#*\([a-zA-Z0-9]*\))$/\1/p'] < ./depcomp`
  fi
  for depmode in $am_compiler_list; do
    # Setup a source with many dependencies, because some compilers
    # like to wrap large dependency lists on column 80 (with \), and
    # we should not choose a depcomp mode which is confused by this.
    #
    # We need to recreate these files for each test, as the compiler may
    # overwrite some of them when testing with obscure command lines.
    # This happens at least with the AIX C compiler.
    : > sub/conftest.c
    for i in 1 2 3 4 5 6; do
      echo '#include "conftst'$i'.h"' >> sub/conftest.c
      # Using `: > sub/conftst$i.h' creates only sub/conftst1.h with
      # Solaris 8's {/usr,}/bin/sh.
      touch sub/conftst$i.h
    done
    echo "${am__include} ${am__quote}sub/conftest.Po${am__quote}" > confmf

    case $depmode in
    nosideeffect)
      # after this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    none) break ;;
    esac
    # We check with `-c' and `-o' for the sake of the "dashmstdout"
    # mode.  It turns out that the SunPro C++ compiler does not properly
    # handle `-M -o', and we need to detect this.
    if depmode=$depmode \
       source=sub/conftest.c object=sub/conftest.${OBJEXT-o} \
       depfile=sub/conftest.Po tmpdepfile=sub/conftest.TPo \
       $SHELL ./depcomp $depcc -c -o sub/conftest.${OBJEXT-o} sub/conftest.c \
         >/dev/null 2>conftest.err &&
       grep sub/conftst1.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftst6.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftest.${OBJEXT-o} sub/conftest.Po > /dev/null 2>&1 &&
       ${MAKE-make} -s -f confmf > /dev/null 2>&1; then
      # icc doesn't choke on unknown options, it will just issue warnings
      # or remarks (even with -Werror).  So we grep stderr for any message
      # that says an option was ignored or not supported.
      # When given -MP, icc 7.0 and 7.1 complain thusly:
      #   icc: Command line warning: ignoring option '-M'; no argument required
      # The diagnosis changed in icc 8.0:
      #   icc: Command line remark: option '-MP' not supported
      if (grep 'ignoring option' conftest.err ||
          grep 'not supported' conftest.err) >/dev/null 2>&1; then :; else
        am_cv_$1_dependencies_compiler_type=$depmode
        break
      fi
    fi
  done

  cd ..
  rm -rf conftest.dir
else
  am_cv_$1_dependencies_compiler_type=none
fi
])
AC_SUBST([$1DEPMODE], [depmode=$am_cv_$1_dependencies_compiler_type])
AM_CONDITIONAL([am__fastdep$1], [
  test "x$enable_dependency_tracking" != xno \
  && test "$am_cv_$1_dependencies_compiler_type" = gcc3])
])


# AM_SET_DEPDIR
# -------------
# Choose a directory name for dependency files.
# This macro is AC_REQUIREd in _AM_DEPENDENCIES
AC_DEFUN([AM_SET_DEPDIR],
[AC_REQUIRE([AM_SET_LEADING_DOT])dnl
AC_SUBST([DEPDIR], ["${am__leading_dot}deps"])dnl
])


# AM_DEP_TRACK
# ------------
AC_DEFUN([AM_DEP_TRACK],
[AC_ARG_ENABLE(dependency-tracking,
[  --disable-dependency-tracking  speeds up one-time build
  --enable-dependency-tracking   do not reject slow dependency extractors])
if test "x$enable_dependency_tracking" != xno; then
  am_depcomp="$ac_aux_dir/depcomp"
  AMDEPBACKSLASH='\'
fi
AM_CONDITIONAL([AMDEP], [test "x$enable_dependency_tracking" != xno])
AC_SUBST([AMDEPBACKSLASH])dnl
_AM_SUBST_NOTMAKE([AMDEPBACKSLASH])dnl
])

# Generate code to set up dependency tracking.              -*- Autoconf -*-

# Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

#serial 3

# _AM_OUTPUT_DEPENDENCY_COMMANDS
# ------------------------------
AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
[for mf in $CONFIG_FILES; do
  # Strip MF so we end up with the name of the file.
  mf=`echo "$mf" | sed -e 's/:.*$//'`
  # Check whether this is an Automake generated Makefile or not.
  # We used to match only the files named `Makefile.in', but
  # some people rename them; so instead we look at the file content.
  # Grep'ing the first line is not enough: some people post-process
  # each Makefile.in and add a new line on top of each file to say so.
  # Grep'ing the whole file is not good either: AIX grep has a line
  # limit of 2048, but all sed's we know have understand at least 4000.
  if sed 10q "$mf" | grep '^#.*generated by automake' > /dev/null 2>&1; then
    dirpart=`AS_DIRNAME("$mf")`
  else
    continue
  fi
  # Extract the definition of DEPDIR, am__include, and am__quote
  # from the Makefile without running `make'.
  DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
  test -z "$DEPDIR" && continue
  am__include=`sed -n 's/^am__include = //p' < "$mf"`
  test -z "am__include" && continue
  am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
  # When using ansi2knr, U may be empty or an underscore; expand it
  U=`sed -n 's/^U = //p' < "$mf"`
  # Find all dependency output files, they are included files with
  # $(DEPDIR) in their names.  We invoke sed twice because it is the
  # simplest approach to changing $(DEPDIR) to its actual value in the
  # expansion.
  for file in `sed -n "
    s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
       sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g' -e 's/\$U/'"$U"'/g'`; do
    # Make sure the directory exists.
    test -f "$dirpart/$file" && continue
    fdir=`AS_DIRNAME(["$file"])`
    AS_MKDIR_P([$dirpart/$fdir])
    # echo "creating $dirpart/$file"
    echo '# dummy' > "$dirpart/$file"
  done
done
])# _AM_OUTPUT_DEPENDENCY_COMMANDS


# AM_OUTPUT_DEPENDENCY_COMMANDS
# -----------------------------
# This macro should only be invoked once -- use via AC_REQUIRE.
#
# This code is only required when automatic dependency tracking
# is enabled.  FIXME.  This creates each `.P' file that we will
# need in order to bootstrap the dependency handling code.
AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
[AC_CONFIG_COMMANDS([depfiles],
     [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
])

# Do all the work for Automake.                             -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004,
# 2005, 2006 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 12

# This macro actually does too much.  Some checks are only needed if
# your package does certain things.  But this isn't really a big deal.

# AM_INIT_AUTOMAKE(PACKAGE, VERSION, [NO-DEFINE])
# AM_INIT_AUTOMAKE([OPTIONS])
# -----------------------------------------------
# The call with PACKAGE and VERSION arguments is the old style
# call (pre autoconf-2.50), which is being phased out.  PACKAGE
# and VERSION should now be passed to AC_INIT and removed from
# the call to AM_INIT_AUTOMAKE.
# We support both call styles for the transition.  After
# the next Automake release, Autoconf can make the AC_INIT
# arguments mandatory, and then we can depend on a new Autoconf
# release and drop the old call support.
AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_PREREQ([2.60])dnl
dnl Autoconf wants to disallow AM_ names.  We explicitly allow
dnl the ones we care about.
m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
AC_REQUIRE([AM_SET_CURRENT_AUTOMAKE_VERSION])dnl
AC_REQUIRE([AC_PROG_INSTALL])dnl
if test "`cd $srcdir && pwd`" != "`pwd`"; then
  # Use -I$(srcdir) only when $(srcdir) != ., so that make's output
  # is not polluted with repeated "-I."
  AC_SUBST([am__isrc], [' -I$(srcdir)'])_AM_SUBST_NOTMAKE([am__isrc])dnl
  # test to see if srcdir already configured
  if test -f $srcdir/config.status; then
    AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
  fi
fi

# test whether we have cygpath
if test -z "$CYGPATH_W"; then
  if (cygpath --version) >/dev/null 2>/dev/null; then
    CYGPATH_W='cygpath -w'
  else
    CYGPATH_W=echo
  fi
fi
AC_SUBST([CYGPATH_W])

# Define the identity of the package.
dnl Distinguish between old-style and new-style calls.
m4_ifval([$2],
[m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
 AC_SUBST([PACKAGE], [$1])dnl
 AC_SUBST([VERSION], [$2])],
[_AM_SET_OPTIONS([$1])dnl
dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
m4_if(m4_ifdef([AC_PACKAGE_NAME], 1)m4_ifdef([AC_PACKAGE_VERSION], 1), 11,,
  [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
 AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
 AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])])dnl

_AM_IF_OPTION([no-define],,
[AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
 AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package])])dnl

# Some tools Automake needs.
AC_REQUIRE([AM_SANITY_CHECK])dnl
AC_REQUIRE([AC_ARG_PROGRAM])dnl
AM_MISSING_PROG(ACLOCAL, aclocal-${am__api_version})
AM_MISSING_PROG(AUTOCONF, autoconf)
AM_MISSING_PROG(AUTOMAKE, automake-${am__api_version})
AM_MISSING_PROG(AUTOHEADER, autoheader)
AM_MISSING_PROG(MAKEINFO, makeinfo)
AM_PROG_INSTALL_SH
AM_PROG_INSTALL_STRIP
AC_REQUIRE([AM_PROG_MKDIR_P])dnl
# We need awk for the "check" target.  The system "awk" is bad on
# some platforms.
AC_REQUIRE([AC_PROG_AWK])dnl
AC_REQUIRE([AC_PROG_MAKE_SET])dnl
AC_REQUIRE([AM_SET_LEADING_DOT])dnl
_AM_IF_OPTION([tar-ustar], [_AM_PROG_TAR([ustar])],
              [_AM_IF_OPTION([tar-pax], [_AM_PROG_TAR([pax])],
	      		     [_AM_PROG_TAR([v7])])])
_AM_IF_OPTION([no-dependencies],,
[AC_PROVIDE_IFELSE([AC_PROG_CC],
                  [_AM_DEPENDENCIES(CC)],
                  [define([AC_PROG_CC],
                          defn([AC_PROG_CC])[_AM_DEPENDENCIES(CC)])])dnl
AC_PROVIDE_IFELSE([AC_PROG_CXX],
                  [_AM_DEPENDENCIES(CXX)],
                  [define([AC_PROG_CXX],
                          defn([AC_PROG_CXX])[_AM_DEPENDENCIES(CXX)])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJC],
                  [_AM_DEPENDENCIES(OBJC)],
                  [define([AC_PROG_OBJC],
                          defn([AC_PROG_OBJC])[_AM_DEPENDENCIES(OBJC)])])dnl
])
])


# When config.status generates a header, we must update the stamp-h file.
# This file resides in the same directory as the config header
# that is generated.  The stamp files are numbered to have different names.

# Autoconf calls _AC_AM_CONFIG_HEADER_HOOK (when defined) in the
# loop where config.status creates the headers, so we can generate
# our stamp files there.
AC_DEFUN([_AC_AM_CONFIG_HEADER_HOOK],
[# Compute $1's index in $config_headers.
_am_stamp_count=1
for _am_header in $config_headers :; do
  case $_am_header in
    $1 | $1:* )
      break ;;
    * )
      _am_stamp_count=`expr $_am_stamp_count + 1` ;;
  esac
done
echo "timestamp for $1" >`AS_DIRNAME([$1])`/stamp-h[]$_am_stamp_count])

# Copyright (C) 2001, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_SH
# ------------------
# Define $install_sh.
AC_DEFUN([AM_PROG_INSTALL_SH],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
install_sh=${install_sh-"\$(SHELL) $am_aux_dir/install-sh"}
AC_SUBST(install_sh)])

# Copyright (C) 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 2

# Check whether the underlying file-system supports filenames
# with a leading dot.  For instance MS-DOS doesn't.
AC_DEFUN([AM_SET_LEADING_DOT],
[rm -rf .tst 2>/dev/null
mkdir .tst 2>/dev/null
if test -d .tst; then
  am__leading_dot=.
else
  am__leading_dot=_
fi
rmdir .tst 2>/dev/null
AC_SUBST([am__leading_dot])])

# Add --enable-maintainer-mode option to configure.         -*- Autoconf -*-
# From Jim Meyering

# Copyright (C) 1996, 1998, 2000, 2001, 2002, 2003, 2004, 2005
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 4

AC_DEFUN([AM_MAINTAINER_MODE],
[AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
  dnl maintainer-mode is disabled by default
  AC_ARG_ENABLE(maintainer-mode,
[  --enable-maintainer-mode  enable make rules and dependencies not useful
			  (and sometimes confusing) to the casual installer],
      USE_MAINTAINER_MODE=$enableval,
      USE_MAINTAINER_MODE=no)
  AC_MSG_RESULT([$USE_MAINTAINER_MODE])
  AM_CONDITIONAL(MAINTAINER_MODE, [test $USE_MAINTAINER_MODE = yes])
  MAINT=$MAINTAINER_MODE_TRUE
  AC_SUBST(MAINT)dnl
]
)

AU_DEFUN([jm_MAINTAINER_MODE], [AM_MAINTAINER_MODE])

# Check to see how 'make' treats includes.	            -*- Autoconf -*-

# Copyright (C) 2001, 2002, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 3

# AM_MAKE_INCLUDE()
# -----------------
# Check to see how make treats includes.
AC_DEFUN([AM_MAKE_INCLUDE],
[am_make=${MAKE-make}
cat > confinc << 'END'
am__doit:
	@echo done
.PHONY: am__doit
END
# If we don't find an include directive, just comment out the code.
AC_MSG_CHECKING([for style of include used by $am_make])
am__include="#"
am__quote=
_am_result=none
# First try GNU make style include.
echo "include confinc" > confmf
# We grep out `Entering directory' and `Leaving directory'
# messages which can occur if `w' ends up in MAKEFLAGS.
# In particular we don't look at `^make:' because GNU make might
# be invoked under some other name (usually "gmake"), in which
# case it prints its new name instead of `make'.
if test "`$am_make -s -f confmf 2> /dev/null | grep -v 'ing directory'`" = "done"; then
   am__include=include
   am__quote=
   _am_result=GNU
fi
# Now try BSD make style include.
if test "$am__include" = "#"; then
   echo '.include "confinc"' > confmf
   if test "`$am_make -s -f confmf 2> /dev/null`" = "done"; then
      am__include=.include
      am__quote="\""
      _am_result=BSD
   fi
fi
AC_SUBST([am__include])
AC_SUBST([am__quote])
AC_MSG_RESULT([$_am_result])
rm -f confinc confmf
])

# Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-

# Copyright (C) 1997, 1999, 2000, 2001, 2003, 2004, 2005
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 5

# AM_MISSING_PROG(NAME, PROGRAM)
# ------------------------------
AC_DEFUN([AM_MISSING_PROG],
[AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])


# AM_MISSING_HAS_RUN
# ------------------
# Define MISSING if not defined so far and test if it supports --run.
# If it does, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([missing])dnl
test x"${MISSING+set}" = xset || MISSING="\${SHELL} $am_aux_dir/missing"
# Use eval to expand $SHELL
if eval "$MISSING --run true"; then
  am_missing_run="$MISSING --run "
else
  am_missing_run=
  AC_MSG_WARN([`missing' script is too old or missing])
fi
])

# Copyright (C) 2003, 2004, 2005, 2006  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_MKDIR_P
# ---------------
# Check for `mkdir -p'.
AC_DEFUN([AM_PROG_MKDIR_P],
[AC_PREREQ([2.60])dnl
AC_REQUIRE([AC_PROG_MKDIR_P])dnl
dnl Automake 1.8 to 1.9.6 used to define mkdir_p.  We now use MKDIR_P,
dnl while keeping a definition of mkdir_p for backward compatibility.
dnl @MKDIR_P@ is magic: AC_OUTPUT adjusts its value for each Makefile.
dnl However we cannot define mkdir_p as $(MKDIR_P) for the sake of
dnl Makefile.ins that do not define MKDIR_P, so we do our own
dnl adjustment using top_builddir (which is defined more often than
dnl MKDIR_P).
AC_SUBST([mkdir_p], ["$MKDIR_P"])dnl
case $mkdir_p in
  [[\\/$]]* | ?:[[\\/]]*) ;;
  */*) mkdir_p="\$(top_builddir)/$mkdir_p" ;;
esac
])

# Helper functions for option handling.                     -*- Autoconf -*-

# Copyright (C) 2001, 2002, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 3

# _AM_MANGLE_OPTION(NAME)
# -----------------------
AC_DEFUN([_AM_MANGLE_OPTION],
[[_AM_OPTION_]m4_bpatsubst($1, [[^a-zA-Z0-9_]], [_])])

# _AM_SET_OPTION(NAME)
# ------------------------------
# Set option NAME.  Presently that only means defining a flag for this option.
AC_DEFUN([_AM_SET_OPTION],
[m4_define(_AM_MANGLE_OPTION([$1]), 1)])

# _AM_SET_OPTIONS(OPTIONS)
# ----------------------------------
# OPTIONS is a space-separated list of Automake options.
AC_DEFUN([_AM_SET_OPTIONS],
[AC_FOREACH([_AM_Option], [$1], [_AM_SET_OPTION(_AM_Option)])])

# _AM_IF_OPTION(OPTION, IF-SET, [IF-NOT-SET])
# -------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
AC_DEFUN([_AM_IF_OPTION],
[m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])

# Check to make sure that the build environment is sane.    -*- Autoconf -*-

# Copyright (C) 1996, 1997, 2000, 2001, 2003, 2005
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 4

# AM_SANITY_CHECK
# ---------------
AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftest.file
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftest.file 2> /dev/null`
   if test "$[*]" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftest.file`
   fi
   rm -f conftest.file
   if test "$[*]" != "X $srcdir/configure conftest.file" \
      && test "$[*]" != "X conftest.file $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "$[2]" = conftest.file
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
AC_MSG_RESULT(yes)])

# Copyright (C) 2001, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_STRIP
# ---------------------
# One issue with vendor `install' (even GNU) is that you can't
# specify the program used to strip binaries.  This is especially
# annoying in cross-compiling environments, where the build's strip
# is unlikely to handle the host's binaries.
# Fortunately install-sh will honor a STRIPPROG variable, so we
# always use install-sh in `make install-strip', and initialize
# STRIPPROG with the value of the STRIP variable (set by the user).
AC_DEFUN([AM_PROG_INSTALL_STRIP],
[AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
# Installed binaries are usually stripped using `strip' when the user
# run `make install-strip'.  However `strip' might not be the right
# tool to use in cross-compilation environments, therefore Automake
# will honor the `STRIP' environment variable to overrule this program.
dnl Don't test for $cross_compiling = yes, because it might be `maybe'.
if test "$cross_compiling" != no; then
  AC_CHECK_TOOL([STRIP], [strip], :)
fi
INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
AC_SUBST([INSTALL_STRIP_PROGRAM])])

# Copyright (C) 2006  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_SUBST_NOTMAKE(VARIABLE)
# ---------------------------
# Prevent Automake from outputing VARIABLE = @VARIABLE@ in Makefile.in.
# This macro is traced by Automake.
AC_DEFUN([_AM_SUBST_NOTMAKE])

# Check how to create a tarball.                            -*- Autoconf -*-

# Copyright (C) 2004, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 2

# _AM_PROG_TAR(FORMAT)
# --------------------
# Check how to create a tarball in format FORMAT.
# FORMAT should be one of `v7', `ustar', or `pax'.
#
# Substitute a variable $(am__tar) that is a command
# writing to stdout a FORMAT-tarball containing the directory
# $tardir.
#     tardir=directory && $(am__tar) > result.tar
#
# Substitute a variable $(am__untar) that extract such
# a tarball read from stdin.
#     $(am__untar) < result.tar
AC_DEFUN([_AM_PROG_TAR],
[# Always define AMTAR for backward compatibility.
AM_MISSING_PROG([AMTAR], [tar])
m4_if([$1], [v7],
     [am__tar='${AMTAR} chof - "$$tardir"'; am__untar='${AMTAR} xf -'],
     [m4_case([$1], [ustar],, [pax],,
              [m4_fatal([Unknown tar format])])
AC_MSG_CHECKING([how to create a $1 tar archive])
# Loop over all known methods to create a tar archive until one works.
_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
_am_tools=${am_cv_prog_tar_$1-$_am_tools}
# Do not fold the above two line into one, because Tru64 sh and
# Solaris sh will not grok spaces in the rhs of `-'.
for _am_tool in $_am_tools
do
  case $_am_tool in
  gnutar)
    for _am_tar in tar gnutar gtar;
    do
      AM_RUN_LOG([$_am_tar --version]) && break
    done
    am__tar="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$$tardir"'
    am__tar_="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$tardir"'
    am__untar="$_am_tar -xf -"
    ;;
  plaintar)
    # Must skip GNU tar: if it does not support --format= it doesn't create
    # ustar tarball either.
    (tar --version) >/dev/null 2>&1 && continue
    am__tar='tar chf - "$$tardir"'
    am__tar_='tar chf - "$tardir"'
    am__untar='tar xf -'
    ;;
  pax)
    am__tar='pax -L -x $1 -w "$$tardir"'
    am__tar_='pax -L -x $1 -w "$tardir"'
    am__untar='pax -r'
    ;;
  cpio)
    am__tar='find "$$tardir" -print | cpio -o -H $1 -L'
    am__tar_='find "$tardir" -print | cpio -o -H $1 -L'
    am__untar='cpio -i -H $1 -d'
    ;;
  none)
    am__tar=false
    am__tar_=false
    am__untar=false
    ;;
  esac

  # If the value was cached, stop now.  We just wanted to have am__tar
  # and am__untar set.
  test -n "${am_cv_prog_tar_$1}" && break

  # tar/untar a dummy directory, and stop if the command works
  rm -rf conftest.dir
  mkdir conftest.dir
  echo GrepMe > conftest.dir/file
  AM_RUN_LOG([tardir=conftest.dir && eval $am__tar_ >conftest.tar])
  rm -rf conftest.dir
  if test -s conftest.tar; then
    AM_RUN_LOG([$am__untar <conftest.tar])
    grep GrepMe conftest.dir/file >/dev/null 2>&1 && break
  fi
done
rm -rf conftest.dir

AC_CACHE_VAL([am_cv_prog_tar_$1], [am_cv_prog_tar_$1=$_am_tool])
AC_MSG_RESULT([$am_cv_prog_tar_$1])])
AC_SUBST([am__tar])
AC_SUBST([am__untar])
]) # _AM_PROG_TAR

m4_include([m4/libtool.m4])
m4_include([m4/ltoptions.m4])
m4_include([m4/ltsugar.m4])
m4_include([m4/ltversion.m4])
m4_include([m4/lt~obsolete.m4])
