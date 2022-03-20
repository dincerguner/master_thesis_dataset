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

SET LOCALCLASSPATH=lib\junit-3.8.1.jar;lib\commons-logging-1.0.1.jar;lib\log4j-1.2.8.jar;src\contrib\lib\xmlParserAPIs-2.2.1.jar;src\contrib\lib\commons-beanutils-1.6.jar;src\contrib\lib\xercesImpl-2.4.0.jar;src\contrib\lib\commons-collections-2.1.jar;src\contrib\lib\commons-lang-1.0-b1.jar;
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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% src\contrib\src\org\apache\poi\hssf\usermodel\contrib\*.java src\contrib\src\org\apache\poi\hssf\contrib\view\*.java src\contrib\src\org\apache\poi\contrib\poibrowser\*.java src\contrib\src\org\apache\poi\contrib\metrics\*.java src\java\org\apache\poi\hssf\eventmodel\*.java src\java\org\apache\poi\hssf\usermodel\*.java src\java\org\apache\poi\hssf\dev\*.java src\java\org\apache\poi\hssf\model\*.java src\java\org\apache\poi\hssf\util\*.java src\java\org\apache\poi\hssf\record\*.java src\java\org\apache\poi\hssf\record\aggregates\*.java src\java\org\apache\poi\hssf\record\formula\*.java src\java\org\apache\poi\hssf\eventusermodel\*.java src\java\org\apache\poi\dev\*.java src\java\org\apache\poi\util\*.java src\java\org\apache\poi\ddf\*.java src\java\org\apache\poi\hpsf\wellknown\*.java src\java\org\apache\poi\hpsf\*.java src\java\org\apache\poi\poifs\common\*.java src\java\org\apache\poi\poifs\storage\*.java src\java\org\apache\poi\poifs\dev\*.java src\java\org\apache\poi\poifs\filesystem\*.java src\java\org\apache\poi\poifs\eventfilesystem\*.java src\java\org\apache\poi\poifs\property\*.java src\scratchpad\src\org\apache\poi\hssf\usermodel\*.java src\scratchpad\src\org\apache\poi\hdf\model\util\*.java src\scratchpad\src\org\apache\poi\hdf\model\hdftypes\*.java src\scratchpad\src\org\apache\poi\hdf\model\hdftypes\definitions\*.java src\scratchpad\src\org\apache\poi\hdf\model\*.java src\scratchpad\src\org\apache\poi\hdf\generator\*.java src\scratchpad\src\org\apache\poi\hdf\event\*.java src\scratchpad\src\org\apache\poi\hdf\extractor\*.java src\scratchpad\src\org\apache\poi\hdf\extractor\data\*.java src\scratchpad\src\org\apache\poi\hdf\extractor\util\*.java src\scratchpad\src\org\apache\poi\generator\*.java