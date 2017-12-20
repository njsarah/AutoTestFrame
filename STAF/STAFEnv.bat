@echo off
REM STAF environment variables
set PATH=D:\AutoTestFrame\STAF\bin;%PATH%
set CLASSPATH=D:\AutoTestFrame\STAF\bin\JSTAF.jar;D:\AutoTestFrame\STAF\samples\demo\STAFDemo.jar;%CLASSPATH%
set STAFCONVDIR=D:\AutoTestFrame\STAF\codepage
if "%1" EQU "" set STAF_INSTANCE_NAME=STAF
if "%1" NEQ "" set STAF_INSTANCE_NAME=%1
