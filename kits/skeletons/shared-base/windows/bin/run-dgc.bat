echo off
rem @COPYRIGHT@

SETLOCAL
SET TOPDIR=%~d0%~p0..
IF "x%TC_INSTALL_DIR%"=="x" SET TC_INSTALL_DIR=%TOPDIR%\..
CALL "%TOPDIR%\libexec\tc-functions.bat" tc_install_dir "%TC_INSTALL_DIR%"
CALL "%TOPDIR%\libexec\tc-functions.bat" tc_classpath "" TRUE
CALL "%TOPDIR%\libexec\tc-functions.bat" tc_java_opts -Dcom.sun.management.jmxremote "-Dtc.install-root=%TC_INSTALL_DIR%" -Dcom.sun.jmx.trace.level=TRACE
CALL "%TOPDIR%\libexec\tc-functions.bat" tc_java -classpath "%TC_CLASSPATH%" %TC_ALL_JAVA_OPTS% com.tc.gcrunner.GCRunner %*
ENDLOCAL
