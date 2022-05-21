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

SET LOCALCLASSPATH=bin\regexp.jar;bin\ant.jar;bin\java_cup.jar;bin\xml-apis.jar;bin\BCEL.jar;bin\xercesImpl.jar;bin\xalan2jdoc.jar;bin\bsf.jar;bin\stylebook-1.0-b3_xalan-2.jar;bin\JLex.jar;bin\runtime.jar;bin\xerces.jar;
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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\java\fr\jayasoft\ivy\*.java src\java\fr\jayasoft\ivy\parser\*.java src\java\fr\jayasoft\ivy\xml\*.java src\java\fr\jayasoft\ivy\conflict\*.java src\java\fr\jayasoft\ivy\repository\*.java src\java\fr\jayasoft\ivy\repository\sftp\*.java src\java\fr\jayasoft\ivy\repository\url\*.java src\java\fr\jayasoft\ivy\repository\file\*.java src\java\fr\jayasoft\ivy\repository\vfs\*.java src\java\fr\jayasoft\ivy\repository\vsftp\*.java src\java\fr\jayasoft\ivy\repository\ssh\*.java src\java\fr\jayasoft\ivy\report\*.java src\java\fr\jayasoft\ivy\url\*.java src\java\fr\jayasoft\ivy\filter\*.java src\java\fr\jayasoft\ivy\event\download\*.java src\java\fr\jayasoft\ivy\event\*.java src\java\fr\jayasoft\ivy\event\resolve\*.java src\java\fr\jayasoft\ivy\version\*.java src\java\fr\jayasoft\ivy\circular\*.java src\java\fr\jayasoft\ivy\resolver\*.java src\java\fr\jayasoft\ivy\extendable\*.java src\java\fr\jayasoft\ivy\status\*.java src\java\fr\jayasoft\ivy\ant\*.java src\java\fr\jayasoft\ivy\util\*.java src\java\fr\jayasoft\ivy\namespace\*.java src\java\fr\jayasoft\ivy\matcher\*.java src\java\fr\jayasoft\ivy\external\m2\*.java src\java\fr\jayasoft\ivy\tools\analyser\*.java src\java\fr\jayasoft\ivy\latest\*.java