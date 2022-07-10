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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\tar\*.java %TOOLS%\mail\*.java %TOOLS%\bzip2\*.java %TOOLS%\zip\*.java %TOOLS%\ant\*.java %TOOLS%\ant\helper\*.java %TOOLS%\ant\taskdefs\*.java %TOOLS%\ant\taskdefs\optional\extension\*.java %TOOLS%\ant\taskdefs\optional\extension\resolvers\*.java %TOOLS%\ant\taskdefs\optional\javacc\*.java %TOOLS%\ant\taskdefs\optional\*.java %TOOLS%\ant\taskdefs\optional\splash\*.java %TOOLS%\ant\taskdefs\optional\clearcase\*.java %TOOLS%\ant\taskdefs\optional\jdepend\*.java %TOOLS%\ant\taskdefs\optional\sos\*.java %TOOLS%\ant\taskdefs\optional\junit\*.java %TOOLS%\ant\taskdefs\optional\jlink\*.java %TOOLS%\ant\taskdefs\optional\script\*.java %TOOLS%\ant\taskdefs\optional\perforce\*.java %TOOLS%\ant\taskdefs\optional\j2ee\*.java %TOOLS%\ant\taskdefs\optional\ejb\BorlandDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\BorlandGenerateClient.java %TOOLS%\ant\taskdefs\optional\ejb\DescriptorHandler.java %TOOLS%\ant\taskdefs\optional\ejb\EJBDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\EjbJar.java %TOOLS%\ant\taskdefs\optional\ejb\GenericDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\InnerClassFilenameFilter.java %TOOLS%\ant\taskdefs\optional\ejb\IPlanetDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc.java %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbcTask.java %TOOLS%\ant\taskdefs\optional\ejb\JbossDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\JonasDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\WeblogicDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\WeblogicTOPLinkDeploymentTool.java %TOOLS%\ant\taskdefs\optional\ejb\WebsphereDeploymentTool.java %TOOLS%\ant\taskdefs\optional\dotnet\*.java %TOOLS%\ant\taskdefs\optional\net\*.java %TOOLS%\ant\taskdefs\optional\i18n\*.java %TOOLS%\ant\taskdefs\optional\javah\*.java %TOOLS%\ant\taskdefs\optional\depend\*.java %TOOLS%\ant\taskdefs\optional\depend\constantpool\*.java %TOOLS%\ant\taskdefs\optional\windows\*.java %TOOLS%\ant\taskdefs\optional\sound\*.java %TOOLS%\ant\taskdefs\optional\vss\*.java %TOOLS%\ant\taskdefs\optional\pvcs\*.java %TOOLS%\ant\taskdefs\optional\ssh\*.java %TOOLS%\ant\taskdefs\optional\native2ascii\*.java %TOOLS%\ant\taskdefs\optional\unix\*.java %TOOLS%\ant\taskdefs\optional\jsp\*.java %TOOLS%\ant\taskdefs\optional\jsp\compilers\*.java %TOOLS%\ant\taskdefs\optional\ccm\*.java %TOOLS%\ant\taskdefs\cvslib\*.java %TOOLS%\ant\taskdefs\rmic\*.java %TOOLS%\ant\taskdefs\email\*.java %TOOLS%\ant\taskdefs\compilers\*.java %TOOLS%\ant\taskdefs\condition\*.java %TOOLS%\ant\input\*.java %TOOLS%\ant\types\*.java %TOOLS%\ant\types\optional\*.java %TOOLS%\ant\types\optional\depend\*.java %TOOLS%\ant\types\resources\*.java %TOOLS%\ant\types\resources\selectors\*.java %TOOLS%\ant\types\resources\comparators\*.java %TOOLS%\ant\types\mappers\*.java %TOOLS%\ant\types\selectors\*.java %TOOLS%\ant\types\selectors\modifiedselector\*.java %TOOLS%\ant\types\spi\*.java %TOOLS%\ant\types\resolver\*.java %TOOLS%\ant\dispatch\*.java %TOOLS%\ant\filters\*.java %TOOLS%\ant\filters\util\*.java %TOOLS%\ant\listener\*.java %TOOLS%\ant\launch\*.java %TOOLS%\ant\util\*.java %TOOLS%\ant\util\optional\*.java %TOOLS%\ant\util\java15\*.java %TOOLS%\ant\util\facade\*.java %TOOLS%\ant\util\depend\bcel\*.java %TOOLS%\ant\util\depend\*.java %TOOLS%\ant\util\regexp\*.java %TOOLS%\ant\loader\*.java