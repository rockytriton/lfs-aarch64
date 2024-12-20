# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize various items

!ifndef PSL_FILE
PSL_FILE=..\list\public_suffix_list.dat
!endif

!ifndef PSL_TESTFILE
PSL_TESTFILE=..\list\tests\tests.txt
!endif

PSL_FILE_INPUT = $(PSL_FILE:\=/)
PSL_TESTFILE_INPUT = $(PSL_TESTFILE:\=/)

# We only support using the ICU runtime, or no runtime
# for Visual Studio builds
!if "$(CFG)" == "Release" || "$(CFG)" == "release"
ICUUC_LIB = icuuc.lib
!else
ICUUC_LIB = icuucd.lib
!endif

ICONV_LIB = iconv.lib
GETTEXT_LIB = intl.lib

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Version info

PACKAGE_NAME=libpsl
PACKAGE_VERSION=0.21.5
PACKAGE_URL=https://github.com/rockdaboot/libpsl

# Bare minimum features and sources built into libpsl on Windows

!if "$(PLAT)" == "x64"
SSIZE_T_DEF = signed __int64
!else
SSIZE_T_DEF = signed int
!endif

PSL_ADDITIONAL_LIBS = ws2_32.lib
PSL_ADDITIONAL_CFLAGS = /DBUILDING_PSL

BASE_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DHAVE_CONFIG_H				\
	/Dssize_t="$(SSIZE_T_DEF)"

PSL_INCLUDES = /I..\include /I.. /Ivs$(VSVER)\$(CFG)\$(PLAT)\libpsl /I$(PREFIX)\include

# We build the psl.dll or psl.lib at least, with the psl.exe utility
PSL_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\psl.lib
PSL_UTILS = vs$(VSVER)\$(CFG)\$(PLAT)\psl.exe

PSL_TESTS =	\
	vs$(VSVER)\$(CFG)\$(PLAT)\test-is-public.exe		\
	vs$(VSVER)\$(CFG)\$(PLAT)\test-is-public-all.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\test-is-cookie-domain-acceptable.exe

PSL_TEST_DATA =	\
	vs$(VSVER)\$(CFG)\$(PLAT)\psl.dafsa	\
	vs$(VSVER)\$(CFG)\$(PLAT)\psl_ascii.dafsa

PSL_MAKE_OPTIONS = CFG^=$(CFG)

!ifndef STATIC
!ifdef USE_LIBTOOL_DLLNAME
PSL_DLL_PREFIX = lib
PSL_DLL_SUFFIX = -5
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) USE_LIBTOOL_DLLNAME^=$(USE_LIBTOOL_DLLNAME)
!else
PSL_DLL_PREFIX =
PSL_DLL_SUFFIX =
!endif
!endif

PSL_DLL = vs$(VSVER)\$(CFG)\$(PLAT)\$(PSL_DLL_PREFIX)psl$(PSL_DLL_SUFFIX).dll

# ENABLED_RUNTIME and ENABLE_BUILTIN are currently dummy arguments to NMake
ENABLED_RUNTIME =
ENABLE_BUILTIN =

!ifndef DISABLE_RUNTIME
BASE_CFLAGS = $(BASE_CFLAGS) /DWITH_LIBICU=1
ENABLED_RUNTIME = libicu
!else
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) DISABLE_RUNTIME^=1
ENABLED_RUNTIME = none
!endif

!ifndef DISABLE_BUILTIN
BASE_CFLAGS = $(BASE_CFLAGS) /DENABLE_BUILTIN=1
ENABLE_BUILTIN = yes
!else
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) DISABLE_BUILTIN^=1
ENABLE_BUILTIN = no
!endif

!ifdef STATIC
BASE_CFLAGS = $(BASE_CFLAGS) /DPSL_STATIC
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) STATIC^=1
PSL_LIBTYPE = static
!else
PSL_LIBTYPE = DLL
!endif

!if "$(DISABLE_RUNTIME)" == ""
PSL_ADDITIONAL_LIBS = $(PSL_ADDITIONAL_LIBS) $(ICUUC_LIB)
endif

!if "$(DISABLE_BUILTIN)" == ""
PSL_TESTS =	\
	$(PSL_TESTS)	\
	vs$(VSVER)\$(CFG)\$(PLAT)\test-is-public-builtin.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\test-registrable-domain.exe
!endif

!ifdef USE_GETTEXT
USE_ICONV=1
PSL_ADDITIONAL_LIBS = $(PSL_ADDITIONAL_LIBS) $(GETTEXT_LIB)
BASE_CFLAGS = $(BASE_CFLAGS) /DUSE_GETTEXT=1
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) USE_GETTEXT^=1
!endif

!ifdef USE_ICONV
PSL_ADDITIONAL_LIBS = $(PSL_ADDITIONAL_LIBS) $(ICONV_LIB)
BASE_CFLAGS = $(BASE_CFLAGS) /DUSE_ICONV=1
PSL_MAKE_OPTIONS = $(PSL_MAKE_OPTIONS) USE_ICONV^=1
!endif

PSL_TEST_CFLAGS =	\
	$(BASE_CFLAGS)	\
	/DPSL_TESTFILE=\"$(PSL_TESTFILE_INPUT)\"	\
	/DPSL_FILE=\"$(PSL_FILE_INPUT)\"	\
	/DPSL_DAFSA=\"$(MAKEDIR:\=/)/vs$(VSVER)/$(CFG)/$(PLAT)/psl.dafsa\" 	\
	/DPSL_ASCII_DAFSA=\"$(MAKEDIR:\=/)/vs$(VSVER)/$(CFG)/$(PLAT)/psl_ascii.dafsa\"

# Visual Studio 2013 or earlier does not have snprintf(),
# so use _snprintf() which seems to be enough for our purposes
!if $(VSVER) < 14
PSL_TEST_CFLAGS = $(PSL_TEST_CFLAGS) /Dsnprintf=_snprintf
!endif
