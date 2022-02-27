@echo off

REM You will need to specify JAVA_HOME if compiling with 1.2 or later.

REM    Copyright (c) 2000-2002 The Apache Software Foundation.  All rights
REM    reserved.

set OLDJAVA=%JAVA%
set OLDJAVAC=%JAVAC%
set BOOTOLDCLASSPATH=%CLASSPATH%
set OLDANTHOME=%ANT_HOME%

set ANT_HOME=.

if "" == "%JAVA%"  if "" == "%JAVA_HOME%" set JAVA=java
if "" == "%JAVA%"                         set JAVA=%JAVA_HOME%\bin\java

if "" == "%JAVAC%" if "" == "%JAVA_HOME%" set JAVAC=javac
if "" == "%JAVAC%"                        set JAVAC=%JAVA_HOME%\bin\javac

echo.
echo ... Bootstrapping Ant Distribution

if     "%OS%" == "Windows_NT" if exist bootstrap\nul rmdir/s/q bootstrap
if not "%OS%" == "Windows_NT" if exist bootstrap\nul deltree/y bootstrap
if     "%OS%" == "Windows_NT" if exist build\nul rmdir/s/q build
if not "%OS%" == "Windows_NT" if exist build\nul deltree/y build

SET LOCALCLASSPATH=lib\xercesImpl.jar;lib\xml-apis.jar
for %%i in (lib\optional\*.jar) do call src\script\lcp.bat %%i
if exist "%JAVA_HOME%\lib\tools.jar" call src\script\lcp.bat %JAVA_HOME%\lib\tools.jar
if exist "%JAVA_HOME%\lib\classes.zip" call src\script\lcp.bat %JAVA_HOME%\lib\classes.zip

set TOOLS=src\main\org\apache\tools
set CLASSDIR=build\classes

SET CLASSPATH=%LOCALCLASSPATH%;%CLASSDIR%;src\main;%CLASSPATH%

echo JAVA_HOME=%JAVA_HOME%
echo JAVA=%JAVA%
echo JAVAC=%JAVAC%
echo CLASSPATH=%CLASSPATH%

if     "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul rmdir/s/q %CLASSDIR%
if not "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul deltree/y %CLASSDIR%

if not exist build\nul mkdir build
if not exist build\classes\nul mkdir build\classes

echo.
echo ... Compiling Ant Classes

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\bzip2\*.java %TOOLS%\tar\*.java %TOOLS%\zip\*.java %TOOLS%\ant\*.java %TOOLS%\ant\types\*.java %TOOLS%\ant\taskdefs\*.java %TOOLS%\ant\util\*.java %TOOLS%\ant\util\regexp\RegexpMatcher.java %TOOLS%\ant\util\regexp\RegexpMatcherFactory.java %TOOLS%\ant\taskdefs\condition\*.java %TOOLS%\ant\taskdefs\compilers\*.java 


"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\util\JavaClassHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogWriter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\MailLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RedirectingOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsTagDiff.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsTagEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogParser.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\RegexpUtil.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsUser.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CVSEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\input\PropertyFileInputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\AnsiColorLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RedirectingStreamHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RCSFile.java