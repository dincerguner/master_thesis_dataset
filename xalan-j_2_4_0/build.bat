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

SET LOCALCLASSPATH=lib\regexp.jar;lib\ant.jar;lib\java_cup.jar;lib\xml-apis.jar;lib\BCEL.jar;lib\xercesImpl.jar;lib\xalan2jdoc.jar;lib\bsf.jar;lib\stylebook-1.0-b3_xalan-2.jar;lib\JLex.jar;lib\runtime.jar;
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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\apache\xalan\extensions\*.java src\apache\xalan\trace\*.java src\apache\xalan\client\*.java src\apache\xalan\transformer\*.java src\apache\xalan\lib\*.java src\apache\xalan\lib\sql\*.java src\apache\xalan\templates\*.java src\apache\xalan\res\*.java src\apache\xalan\processor\*.java src\apache\xalan\*.java src\apache\xalan\serialize\*.java src\apache\xalan\xsltc\runtime\*.java src\apache\xalan\xsltc\runtime\output\*.java src\apache\xalan\xsltc\dom\*.java src\apache\xalan\xsltc\*.java src\apache\xalan\xsltc\util\*.java src\apache\xalan\xsltc\compiler\*.java src\apache\xalan\xsltc\compiler\util\*.java src\apache\xalan\xsltc\cmdline\*.java src\apache\xalan\xsltc\cmdline\getopt\*.java src\apache\xalan\xsltc\trax\*.java src\apache\xalan\xslt\*.java src\apache\xmlcommons\*.java src\apache\xpath\functions\*.java src\apache\xpath\*.java src\apache\xpath\objects\*.java src\apache\xpath\axes\*.java src\apache\xpath\res\*.java src\apache\xpath\patterns\*.java src\apache\xpath\compiler\*.java src\apache\xpath\operations\*.java src\apache\xml\dtm\*.java src\apache\xml\dtm\ref\*.java src\apache\xml\dtm\ref\sax2dtm\*.java src\apache\xml\dtm\ref\dom2dtm\*.java src\apache\xml\utils\*.java src\apache\xml\utils\res\*.java src\apache\xml\utils\synthetic\*.java src\apache\xml\utils\synthetic\reflection\*.java src\xml\sax\*.java src\xml\sax\ext\*.java src\xml\sax\helpers\*.java src\w3c\dom\*.java src\w3c\dom\traversal\*.java src\w3c\dom\events\*.java src\w3c\dom\html\*.java src\w3c\dom\css\*.java src\w3c\dom\stylesheets\*.java src\w3c\dom\ranges\*.java src\w3c\dom\views\*.java

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\xml\parsers\*.java src\xml\transform\*.java src\xml\transform\dom\*.java src\xml\transform\stream\*.java src\xml\transform\sax\*.java

