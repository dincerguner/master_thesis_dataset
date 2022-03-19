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

SET LOCALCLASSPATH=lib\sax-2.0.1.jar;lib\jaxp-api-1.4;lib\w3c.jar
for %%i in (lib\optional\*.jar) do call src\script\lcp.bat %%i
if exist "%JAVA_HOME%\lib\tools.jar" call src\script\lcp.bat %JAVA_HOME%\lib\tools.jar
if exist "%JAVA_HOME%\lib\classes.zip" call src\script\lcp.bat %JAVA_HOME%\lib\classes.zip

set TOOLS=src\main\org\apache\tools
set CLASSDIR=build\classes

SET CLASSPATH=%LOCALCLASSPATH%;%CLASSDIR%;build\classes;%CLASSPATH%

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




@REM "%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\org\apache\wml\*.java src\org\apache\wml\dom\*.java src\org\apache\html\dom\*.java src\org\apache\xml\serialize\*.java src\org\apache\xerces\dom\*.java src\org\apache\xerces\dom\events\*.java src\org\apache\xerces\readers\*.java src\org\apache\xerces\parsers\*.java src\org\apache\xerces\msg\*.java src\org\apache\xerces\utils\*.java src\org\apache\xerces\utils\regex\*.java src\org\apache\xerces\jaxp\*.java src\org\apache\xerces\domx\*.java src\org\apache\xerces\framework\*.java src\org\apache\xerces\validators\common\*.java src\org\apache\xerces\validators\schema\*.java src\org\apache\xerces\validators\datatype\*.java src\org\apache\xerces\validators\dtd\*.java src\org\xml\sax\*.java src\org\xml\sax\ext\*.java src\org\xml\sax\helpers\*.java src\org\w3c\dom\*.java src\org\w3c\dom\traversal\*.java src\org\w3c\dom\events\*.java src\org\w3c\dom\html\*.java src\org\w3c\dom\range\*.java

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\org\xml\sax\*.java src\org\xml\sax\ext\*.java src\org\xml\sax\helpers\*.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\org\w3c\dom\*.java src\org\w3c\dom\traversal\*.java src\org\w3c\dom\events\*.java src\org\w3c\dom\html\*.java src\org\w3c\dom\ranges\*.java

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\javax\xml\parsers\*.java

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\org\apache\wml\*.java src\org\apache\wml\dom\*.java src\org\apache\html\dom\*.java src\org\apache\xml\serialize\*.java src\org\apache\xerces\dom\*.java src\org\apache\xerces\dom\events\*.java src\org\apache\xerces\readers\*.java src\org\apache\xerces\parsers\*.java src\org\apache\xerces\msg\*.java src\org\apache\xerces\utils\*.java src\org\apache\xerces\utils\regex\*.java src\org\apache\xerces\jaxp\*.java src\org\apache\xerces\domx\*.java src\org\apache\xerces\framework\*.java src\org\apache\xerces\validators\common\*.java src\org\apache\xerces\validators\schema\identity\*.java src\org\apache\xerces\validators\schema\*.java src\org\apache\xerces\validators\datatype\*.java src\org\apache\xerces\validators\dtd\*.java