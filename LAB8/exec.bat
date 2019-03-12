@echo off

if NOT "%1"=="help" goto execute

:help
echo Instruction: Copy this batch file in the folder having MASM.EXE, LINK.EXE and TD.EXE.
echo Instead of using all commands individually, use this script.
echo.
echo Usage: exec <asm-filename> [notd]
echo.
echo.
echo Assume file is saved as foo.asm
echo.
echo Example: exec foo notd	; doesn't run td
echo Example: exec foo	; run td after building and linking
goto exit

:execute
masm %1.asm;
link %1.obj;

if "%2"=="notd" goto exit

td %1.exe

:exit
@echo on