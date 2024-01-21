@echo off

rem Compile a COBOL program

rem are env strings already defined? (tried using () here, but it failed so goto it is

if NOT "%COB_MAIN_DIR%" == "" goto cont

rem define env strings

set COB_MAIN_DIR=c:\Users\mason\Downloads\ProgramExes\gnucobol-3.3-dev-MinGW-binaries\
set COB_CONFIG_DIR=%COB_MAIN_DIR%config
set COB_COPY_DIR=%COB_MAIN_DIR%copy
set COB_CFLAGS=-I"%COB_MAIN_DIR%include" %COB_CFLAGS%
set COB_LDFLAGS=-L"%COB_MAIN_DIR%lib" %COB_LDFLAGS%
set COB_LIBRARY_PATH=%COB_MAIN_DIR%extras
set PATH=%COB_MAIN_DIR%bin;%PATH%
	
:cont

rem Start the compiler

cobc -x %*