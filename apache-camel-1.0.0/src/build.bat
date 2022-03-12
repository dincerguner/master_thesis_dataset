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

SET LOCALCLASSPATH=lib\optional\smack-3.0.4.jar;lib\optional\commons-logging-1.2.jar;lib\optional\commons-logging.jar;lib\optional\commons-beanutils-1.6.1.jar;lib\optional\commons-collections-3.1.jar;lib\optional\commons-dbcp-1.2.jar;lib\optional\commons-httpclient-2.0.1.jar;lib\optional\commons-pool-1.2.jar;lib\optional\geronimo-j2ee-connector_1.5_spec-1.0.jar;lib\optional\geronimo-j2ee-jacc_1.0_spec-1.0.jar;lib\optional\geronimo-j2ee-management_1.0_spec-1.0.jar;lib\optional\geronimo-jms_1.1_spec-1.0.jar;lib\optional\spring-2.0.5.jar;lib\optional\xbean-spring-3.0.jar

set CLASSDIR=build\classes

SET CLASSPATH=%LOCALCLASSPATH%;%CLASSDIR%;camel-core\src\main\java;%CLASSPATH%

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

set TOOLS=camel-core/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\*.java %TOOLS%\view\*.java %TOOLS%\builder\*.java %TOOLS%\builder\xml\*.java %TOOLS%\converter\*.java %TOOLS%\converter\jaxp\*.java %TOOLS%\util\*.java %TOOLS%\spi\*.java %TOOLS%\processor\*.java %TOOLS%\processor\idempotent\*.java %TOOLS%\processor\loadbalancer\*.java %TOOLS%\impl\*.java %TOOLS%\impl\converter\*.java %TOOLS%\component\file\*.java %TOOLS%\component\direct\*.java %TOOLS%\component\mock\*.java %TOOLS%\component\pojo\timer\*.java %TOOLS%\component\pojo\*.java %TOOLS%\component\processor\*.java %TOOLS%\component\jmx\*.java %TOOLS%\component\queue\*.java

set TOOLS=components/camel-activemq/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\activemq\*.java

set TOOLS=components/camel-bam/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\bam\*.java %TOOLS%\bam\rules\*.java %TOOLS%\bam\model\*.java %TOOLS%\bam\processor\*.java

set TOOLS=components/camel-cxf/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\cxf\transport\*.java %TOOLS%\component\cxf\*.java

set TOOLS=components/camel-ftp/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\file\remote\*.java

set TOOLS=components/camel-http/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\http\*.java

set TOOLS=components/camel-irc/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\irc\*.java

set TOOLS=components/camel-jaxb/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\converter\jaxb\*.java

set TOOLS=components/camel-jbi/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\jbi\*.java

set TOOLS=components/camel-jms/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\jms\*.java

set TOOLS=components/camel-josql/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\builder\sql\*.java

set TOOLS=components/camel-jpa/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\processor\idempotent\jpa\*.java %TOOLS%\component\jpa\*.java

set TOOLS=components/camel-mail/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\mail\*.java

set TOOLS=components/camel-mina/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\mina\*.java

set TOOLS=components/camel-quartz/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\quartz\*.java

set TOOLS=components/camel-rmi/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\rmi\*.java

set TOOLS=components/camel-saxon/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\builder\saxon\*.java

set TOOLS=components/camel-script/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\builder\script\*.java

set TOOLS=components/camel-spring/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\spring\*.java %TOOLS%\spring\converter\*.java %TOOLS%\spring\util\*.java %TOOLS%\spring\spi\*.java %TOOLS%\spring\xml\*.java %TOOLS%\spring\remoting\*.java %TOOLS%\spring\component\*.java

set TOOLS=components/camel-xmpp/src/main/java/org/apache/camel
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\component\xmpp\*.java