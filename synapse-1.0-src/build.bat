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

SET LOCALCLASSPATH=lib\rampart-policy-1.2.jar;lib\groovy-all-1.0.jar;lib\XmlSchema-1.3.1.jar;lib\annogen-0.1.0.jar;lib\stax-api-1.0.1.jar;lib\jaxen-1.1-beta-10.jar;lib\synapse-extensions-1.0.jar;lib\woden-1.0-incubating-M7a.jar;lib\axis2-java2wsdl-1.2.jar;lib\xbean-2.2.0.jar;lib\commons-fileupload-1.1.1.jar;lib\opensaml-1.1.jar;lib\neethi-2.0.1.jar;lib\log4j-1.2.13.jar;lib\wso2throttle-1.2.jar;lib\axis2-adb-1.2.jar;lib\commons-logging-1.1.jar;lib\axiom-dom-1.2.4.jar;lib\sandesha2-core-1.2.jar;lib\js-1.6R5.jar;lib\endorsed\xml-apis-1.3.03.jar;lib\endorsed\xercesImpl-2.8.1.jar;lib\jakarta-httpcore-niossl-4.0-alpha4.jar;lib\synapse-nhttp-1.0.jar;lib\rampart-core-1.2.jar;lib\jakarta-httpcore-4.0-alpha4.jar;lib\wstx-asl-3.2.1.jar;lib\jakarta-httpcore-nio-4.0-alpha4.jar;lib\mail-1.4.jar;lib\axis2-kernel-1.2.jar;lib\spring-1.2.6.jar;lib\commons-httpclient-3.0.1.jar;lib\synapse-core-1.0.jar;lib\axis2-mtompolicy-1.2.jar;lib\axiom-api-1.2.4.jar;lib\activation-1.1.jar;lib\geronimo-jms_1.1_spec-1.1.jar;lib\axis2-codegen-1.2.jar;lib\rampart-trust-1.2.jar;lib\sandesha2-policy-1.2.jar;lib\backport-util-concurrent-2.2.jar;lib\bcprov-jdk15-132.jar;lib\axiom-impl-1.2.4.jar;lib\xalan-2.7.0.jar;lib\bsf-all-3.0-beta1.jar;lib\synapse-samples-1.0.jar;lib\bcprov-jdk13-132.jar;lib\xmlsec-1.4.0.jar;lib\commons-codec-1.2.jar;lib\wss4j-1.5.2.jar;lib\wsdl4j-1.6.2.jar;
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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% modules\core\src\main\java\org\apache\synapse\mediators\*.java modules\core\src\main\java\org\apache\synapse\mediators\base\*.java modules\core\src\main\java\org\apache\synapse\mediators\ext\*.java modules\core\src\main\java\org\apache\synapse\mediators\transform\*.java modules\core\src\main\java\org\apache\synapse\mediators\builtin\*.java modules\core\src\main\java\org\apache\synapse\mediators\filters\*.java modules\core\src\main\java\org\apache\synapse\*.java modules\core\src\main\java\org\apache\synapse\metrics\*.java modules\core\src\main\java\org\apache\synapse\util\*.java modules\core\src\main\java\org\apache\synapse\registry\url\*.java modules\core\src\main\java\org\apache\synapse\registry\*.java modules\core\src\main\java\org\apache\synapse\endpoints\*.java modules\core\src\main\java\org\apache\synapse\endpoints\utils\*.java modules\core\src\main\java\org\apache\synapse\endpoints\dispatch\*.java modules\core\src\main\java\org\apache\synapse\endpoints\algorithms\*.java modules\core\src\main\java\org\apache\synapse\config\*.java modules\core\src\main\java\org\apache\synapse\config\xml\*.java modules\core\src\main\java\org\apache\synapse\config\xml\endpoints\*.java modules\core\src\main\java\org\apache\synapse\config\xml\endpoints\utils\*.java modules\core\src\main\java\org\apache\synapse\statistics\*.java modules\core\src\main\java\org\apache\synapse\statistics\impl\*.java modules\core\src\main\java\org\apache\synapse\core\*.java modules\core\src\main\java\org\apache\synapse\core\axis2\*.java

@REM "%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% modules\extensions\src\main\java\org\apache\synapse\mediators\attachment\*.java modules\extensions\src\main\java\org\apache\synapse\mediators\bsf\*.java modules\extensions\src\main\java\org\apache\synapse\mediators\throttle\*.java modules\extensions\src\main\java\org\apache\synapse\mediators\spring\*.java

@REM "%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% modules\nhttp\src\org\apache\axis2\transport\nhttp\*.java modules\nhttp\src\org\apache\axis2\transport\nhttp\util\*.java

