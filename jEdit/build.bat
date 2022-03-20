@echo off

REM You will need to specify JAVA_HOME if compiling with 1.2 or later.

REM  Licensed to the Apache Software Foundation (ASF) under one or more
REM  contributor license agreements.  See the NOTICE file distributed with
REM  this work for additional information regarding copyright ownership.
REM  The ASF licenses this file to You under the Apache License, Version 2.0
REM  (the "License"); you may not use this file except in compliance with
REM  the License.  You may obtain a copy of the License at
REM
REM      http://www.apache.org/licenses/LICENSE-2.0
REM
REM  Unless required by applicable law or agreed to in writing, software
REM  distributed under the License is distributed on an "AS IS" BASIS,
REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM  See the License for the specific language governing permissions and
REM  limitations under the License.

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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% com\microstar\xml\*.java
@REM "%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% de\masters_of_disaster\ant\tasks\calculatesize\*.java de\masters_of_disaster\ant\tasks\deb\*.java de\masters_of_disaster\ant\tasks\ar\*.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% installer\*.java
@REM "%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% net\sourceforge\jarbundler\*.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% org\gjt\sp\util\*.java org\gjt\sp\jedit\*.java org\gjt\sp\jedit\io\*.java org\gjt\sp\jedit\print\*.java org\gjt\sp\jedit\gui\*.java org\gjt\sp\jedit\gui\statusbar\*.java org\gjt\sp\jedit\options\*.java org\gjt\sp\jedit\proto\jeditresource\*.java org\gjt\sp\jedit\bsh\*.java org\gjt\sp\jedit\bsh\commands\*.java org\gjt\sp\jedit\bsh\reflect\*.java org\gjt\sp\jedit\bsh\classpath\*.java org\gjt\sp\jedit\bsh\collection\*.java org\gjt\sp\jedit\bsh\org\objectweb\asm\*.java org\gjt\sp\jedit\msg\*.java org\gjt\sp\jedit\input\*.java org\gjt\sp\jedit\search\*.java org\gjt\sp\jedit\browser\*.java org\gjt\sp\jedit\textarea\*.java org\gjt\sp\jedit\help\*.java org\gjt\sp\jedit\bufferset\*.java org\gjt\sp\jedit\visitors\*.java org\gjt\sp\jedit\bufferio\*.java org\gjt\sp\jedit\menu\*.java org\gjt\sp\jedit\pluginmgr\*.java org\gjt\sp\jedit\indent\*.java org\gjt\sp\jedit\syntax\*.java org\gjt\sp\jedit\buffer\*.java