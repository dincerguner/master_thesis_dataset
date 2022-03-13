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
if     "%OS%" == "Windows_NT" if exist build2\nul rmdir/s/q build2
if not "%OS%" == "Windows_NT" if exist build2\nul deltree/y build2

SET LOCALCLASSPATH=build\lib\ant.jar;build\lib\junit-3.7.jar;build\lib\commons-collections.jar;build\lib\oro.jar;build\lib\log4j-1.1.3.jar;build\lib\bcel-5.0rc1.jar;build\lib\antlr-runtime.jar;build\lib\jdom-b9.jar;build\lib\fop-bin-0_17_0.jar;build\lib\servlet.jar;build\lib\logkit-1.0.1.jar;build\lib\log4j-core-1.1.3.jar;build\lib\werken.xpath.jar;build\lib\w3c.jar;
for %%i in (lib\optional\*.jar) do call src\script\lcp.bat %%i
if exist "%JAVA_HOME%\lib\tools.jar" call src\script\lcp.bat %JAVA_HOME%\lib\tools.jar
if exist "%JAVA_HOME%\lib\classes.zip" call src\script\lcp.bat %JAVA_HOME%\lib\classes.zip

set TOOLS=src\main\org\apache\tools
set CLASSDIR=build2\classes

SET CLASSPATH=%LOCALCLASSPATH%;%CLASSDIR%;src\main;%CLASSPATH%

echo JAVA_HOME=%JAVA_HOME%
echo JAVA=%JAVA%
echo JAVAC=%JAVAC%
echo CLASSPATH=%CLASSPATH%

if     "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul rmdir/s/q %CLASSDIR%
if not "%OS%" == "Windows_NT" if exist %CLASSDIR%\nul deltree/y %CLASSDIR%

if not exist build2\nul mkdir build2
if not exist build2\classes\nul mkdir build2\classes

echo.
echo ... Compiling Ant Classes

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\java\org\apache\velocity\runtime\visitor\*.java src\java\org\apache\velocity\runtime\resource\*.java src\java\org\apache\velocity\runtime\resource\loader\*.java src\java\org\apache\velocity\runtime\parser\*.java src\java\org\apache\velocity\runtime\parser\node\*.java src\java\org\apache\velocity\runtime\directive\*.java src\java\org\apache\velocity\runtime\*.java src\java\org\apache\velocity\runtime\log\*.java src\java\org\apache\velocity\runtime\exception\*.java src\java\org\apache\velocity\runtime\compiler\*.java src\java\org\apache\velocity\runtime\configuration\*.java src\java\org\apache\velocity\io\*.java src\java\org\apache\velocity\*.java src\java\org\apache\velocity\util\*.java src\java\org\apache\velocity\util\introspection\*.java src\java\org\apache\velocity\exception\*.java src\java\org\apache\velocity\context\*.java src\java\org\apache\velocity\servlet\*.java src\java\org\apache\velocity\anakia\*.java src\java\org\apache\velocity\app\*.java src\java\org\apache\velocity\app\tools\*.java src\java\org\apache\velocity\app\event\*.java src\java\org\apache\velocity\texen\ant\*.java src\java\org\apache\velocity\texen\util\*.java src\java\org\apache\velocity\texen\*.java src\java\org\apache\velocity\convert\*.java src\java\org\apache\velocity\test\view\*.java src\java\org\apache\velocity\test\*.java src\java\org\apache\velocity\test\provider\*.java src\java\org\apache\velocity\test\misc\*.java