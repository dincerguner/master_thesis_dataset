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

SET LOCALCLASSPATH=bin\regexp.jar;bin\ant.jar;bin\java_cup.jar;bin\xml-apis.jar;bin\BCEL.jar;bin\xercesImpl.jar;bin\xalan2jdoc.jar;bin\bsf.jar;bin\stylebook-1.0-b3_xalan-2.jar;bin\JLex.jar;bin\runtime.jar;
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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\org\apache\xalan\extensions\*.java src\org\apache\xalan\trace\*.java src\org\apache\xalan\client\*.java src\org\apache\xalan\transformer\*.java src\org\apache\xalan\lib\*.java src\org\apache\xalan\lib\sql\*.java src\org\apache\xalan\templates\*.java src\org\apache\xalan\res\*.java src\org\apache\xalan\processor\*.java src\org\apache\xalan\*.java src\org\apache\xalan\serialize\*.java src\org\apache\xalan\xsltc\runtime\*.java src\org\apache\xalan\xsltc\runtime\output\*.java src\org\apache\xalan\xsltc\dom\*.java src\org\apache\xalan\xsltc\*.java src\org\apache\xalan\xsltc\util\*.java src\org\apache\xalan\xsltc\compiler\*.java src\org\apache\xalan\xsltc\compiler\util\*.java src\org\apache\xalan\xsltc\cmdline\*.java src\org\apache\xalan\xsltc\cmdline\getopt\*.java src\org\apache\xalan\xsltc\trax\*.java src\org\apache\xalan\xslt\*.java src\org\apache\xmlcommons\*.java src\org\apache\xpath\functions\*.java src\org\apache\xpath\*.java src\org\apache\xpath\objects\*.java src\org\apache\xpath\axes\*.java src\org\apache\xpath\res\*.java src\org\apache\xpath\patterns\*.java src\org\apache\xpath\compiler\*.java src\org\apache\xpath\operations\*.java src\org\apache\xml\dtm\*.java src\org\apache\xml\dtm\ref\*.java src\org\apache\xml\dtm\ref\sax2dtm\*.java src\org\apache\xml\dtm\ref\dom2dtm\*.java src\org\apache\xml\utils\*.java src\org\apache\xml\utils\res\*.java src\org\apache\xml\utils\synthetic\*.java src\org\apache\xml\utils\synthetic\reflection\*.java src\org\xml\sax\*.java src\org\xml\sax\ext\*.java src\org\xml\sax\helpers\*.java src\org\w3c\dom\*.java src\org\w3c\dom\traversal\*.java src\org\w3c\dom\events\*.java src\org\w3c\dom\html\*.java src\org\w3c\dom\css\*.java src\org\w3c\dom\stylesheets\*.java src\org\w3c\dom\ranges\*.java src\org\w3c\dom\views\*.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\javax\xml\parsers\*.java src\javax\xml\transform\*.java src\javax\xml\transform\dom\*.java src\javax\xml\transform\stream\*.java src\javax\xml\transform\sax\*.java
