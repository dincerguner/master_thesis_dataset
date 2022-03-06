@echo off

REM You will need to specify JAVA_HOME if compiling with 1.2 or later.

set OLDJAVA=%JAVA%
set OLDJAVAC=%JAVAC%
set OLDCLASSPATH=%CLASSPATH%
set OLDANTHOME=%ANT_HOME%

set ANT_HOME=.

if "" == "%JAVA%"  if "" == "%JAVA_HOME%" set JAVA=java
if "" == "%JAVA%"                         set JAVA=%JAVA_HOME%\bin\java

if "" == "%JAVAC%" if "" == "%JAVA_HOME%" set JAVAC=javac
if "" == "%JAVAC%"                        set JAVAC=%JAVA_HOME%\bin\javac

echo.
echo ... Bootstrapping Ant Distribution

if     "%OS%" == "Windows_NT" if exist bootstrap rmdir/s/q bootstrap
if not "%OS%" == "Windows_NT" if exist bootstrap deltree/y bootstrap

SET LOCALCLASSPATH=lib\parser.jar;lib\jaxp.jar;lib\optional\junit.jar;lib\optional\regexp-1.3.jar;lib\optional\jakarta-oro-2.0.jar

if exist %JAVA_HOME%\lib\tools.jar call src\script\lcp.bat %JAVA_HOME%\lib\tools.jar
if exist %JAVA_HOME%\lib\classes.zip call src\script\lcp.bat %JAVA_HOME%\lib\classes.zip

set TOOLS=src\main\org\apache\tools
set CLASSDIR=classes

SET CLASSPATH=%LOCALCLASSPATH%;%CLASSDIR%;src\main;%CLASSPATH%

echo JAVA_HOME=%JAVA_HOME%
echo JAVA=%JAVA%
echo JAVAC=%JAVAC%
echo CLASSPATH=%CLASSPATH%

if     "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul rmdir/s/q %CLASSDIR%
if not "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul deltree/y %CLASSDIR%

if not exist %CLASSDIR% mkdir %CLASSDIR%
if not exist build mkdir build
if not exist build\classes mkdir build\classes

echo.
echo ... Compiling Ant Classes

%JAVAC% -d %CLASSDIR% %TOOLS%\tar\*.java %TOOLS%\ant\*.java %TOOLS%\ant\types\*.java %TOOLS%\ant\taskdefs\*.java %TOOLS%\ant\util\*.java %TOOLS%\ant\util\regexp\RegexpMatcher.java %TOOLS%\ant\util\regexp\RegexpMatcherFactory.java

%JAVAC% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaRegexpMatcher.java
%JAVAC% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaOroMatcher.java
