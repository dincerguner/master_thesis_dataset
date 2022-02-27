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


"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\bzip2\*.java %TOOLS%\tar\*.java %TOOLS%\zip\*.java %TOOLS%\ant\*.java %TOOLS%\ant\types\*.java %TOOLS%\ant\taskdefs\*.java %TOOLS%\ant\util\regexp\RegexpMatcher.java %TOOLS%\ant\util\regexp\RegexpMatcherFactory.java %TOOLS%\ant\taskdefs\condition\*.java %TOOLS%\ant\taskdefs\compilers\*.java %TOOLS%\ant\types\resources\*.java 
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\MimeMailer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Submit$P4SubmitAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\ConstantPoolEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSCHECKOUT.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\DotnetBaseMatchingTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTaskMirror$JUnitResultFormatterMirror.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jlink\ConstantPool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\Constants.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc$RedirectOutput.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMCheck.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\SSHUserInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\JspNameMangler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\Retryable.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Edit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogWriter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\resolvers\AntResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\FieldRefCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\VisualBasicCompile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\resolvers\URLResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\DotnetCompile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMCheckin.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jlink\jlink.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\ConcatFilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\Utf8CPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\MailLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\compilers\JspCompilerAdapterFactory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Javah.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javah\JavahAdapterFactory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOSCmd.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\WeakishReference.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RedirectingOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSHISTORY.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsTagDiff.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\native2ascii\Native2AsciiAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\BriefJUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCUpdate.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sound\AntSoundPlayer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\JarLibResolveTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\optional\WeakishReference12.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\JonasHotDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4HandlerAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\ScriptSelector.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\comparators\Type.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\JonasDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\XMLResultAggregator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Counter$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsTagEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\ImportTypelib.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Reopen.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\DoubleCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\Ilasm.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSHISTORY$BriefCodediffNofile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\PropertyFile$Entry$Type.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jlink\JlinkTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\NameAndTypeCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaOroMatcher.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$TestResultHolder.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EjbJar$NamingScheme.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCCheckout.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Cab.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\splash\SplashScreen.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\compilers\JasperC.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\WeblogicDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\native2ascii\Native2AsciiAdapterFactory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javacc\JJDoc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSCREATE.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\DOMUtil.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\RegexpUtil.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\AggregateTransformer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\net\SetProxy.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\XMLValidateTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\Compare.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTestRunner$2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTestRunner$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTestRunner$4.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTestRunner$3.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\MethodRefCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Javah$ClassArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\Compatability.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\Ildasm.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\Name.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\i18n\Translate.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\ServerDeploy.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\depend\DependScanner.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\ScriptFilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\comparators\Size.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\ExtensionUtil.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\JarLibAvailableTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resolver\ApacheCatalogResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\PlainJUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\loader\AntClassLoader2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\WeblogicTOPLinkDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\UUMailer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\ArrayEnumeration.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaRegexpMatcher.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Submit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMReconfigure.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\WebsphereDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\pvcs\Pvcs.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTaskMirror$SummaryJUnitResultFormatterMirror.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\EchoProperties$Tuple.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\UUEncoder.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\ScpToMessageBySftp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\depend\bcel\AncestorAnalyzer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\mappers\FilterMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\DescriptorHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\depend\AbstractAnalyzer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\dispatch\DispatchTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\EchoProperties.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCUnlock.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\GenericHotDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\PropertyFile$Entry$Operation.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\SchemaValidate$SchemaLocation.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\ScpFromMessage.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\DeweyDecimal.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\Compatibility.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc$EjbInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\LibFileSet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\UnPackageNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\DotnetResource.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitVersionHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\unix\Symlink.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\JarLibDisplayTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\LibraryDisplayer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Native2Ascii.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsUser.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Script.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\BorlandDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\DOMUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\AbstractHotDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSLABEL.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\LazyHashtable.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\DotnetDefine.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbcTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\Specification.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EjbJar$Config.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\TaskLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Rpm.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTaskMirror.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\InnerClassFilenameFilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\CSharp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\depend\DependencyAnalyzer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Counter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CVSEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\ScriptMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\LogListener.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\ExtraAttribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Integrate.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\ScpToMessage.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\JSharp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javah\Kaffeh.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\RenameExtensions.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Change$2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Change$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\RegexpPatternMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javah\JavahAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\XMLJUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sound\SoundTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Change.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\SSHBase.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\Continuus.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\optional\NoExitSecurityManager.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\RetryHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc$EjbcHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\net\MimeMail.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaOroRegexp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\JarFileIterator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Base.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\CvsVersion.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\Ildasm$EncodingTypes.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Revert.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\FormatterElement$TypeAttribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCUnCheckout.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\Extension.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\Native2Ascii$ExtMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\util\JavaClassHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jlink\ClassNameReader.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\Directory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\CompoundEnumeration.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\script\ScriptDef$NestedElement.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\native2ascii\DefaultNative2Ascii.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\XmlConstants.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTaskMirror$JUnitTestRunnerMirror.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\AbstractScriptComponent.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ReplaceRegExp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\depend\ClassfileSet$ClassRoot.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCRmtype.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jdepend\JDependTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\AbstractSshMessage$ProgressMonitor.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Add.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\InstanceOf.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\JspC$WebAppParameter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSGET.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\java15\ProxyDiagnostics.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ScriptRunnerBase.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\Size.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\comparators\Name.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\DirectoryIterator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\unix\AbstractAccessTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\Jasper41Mangler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\depend\ClassfileSet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\SchemaValidate.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\JbossDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\NetCommand.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Resolve.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\WLJspc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\AbstractSshMessage$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\compilers\JspCompilerAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$JUnitLogOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$SplitLoader.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4OutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\AbstractSshMessage.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$ForkedTestConfiguration.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\WsdlToDotnet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMCheckinDefault.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\optional\ScriptCondition.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EJBDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\MimeMailer$SimpleAuthenticator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\ExtensionResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMkbl.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCCheckin.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSADD.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$JUnitLogStreamHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\None.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\StringInputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\XMLConstants.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\DotnetCompile$TargetTypes.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\JarLibManifestTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EjbJar.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\Enumerations.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\resolvers\LocationResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\XalanExecutor.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\Ilasm$TargetTypes.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\compilers\DefaultJspCompilerAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\ClassFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\ChangeLogParser.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\native2ascii\KaffeNative2Ascii.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Have.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\CommonsLoggingListener.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\optional\JavaxScriptRunner.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\ExtensionAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\WebsphereDeploymentTool$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Fstat.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\splash\SplashTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\AntAnalyzer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOSCheckin.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\FStatP4OutputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\ClassFileIterator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOSLabel.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\comparators\Exists.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\Depend$ClassFileInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\depend\bcel\FullAnalyzer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\InterfaceMethodRefCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\unix\Chown.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\pvcs\PvcsProject.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\OutErrSummaryJUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\AggregateTransformer$Format.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\DOMUtil$NodeListImpl.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\TimestampedLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\XMLValidateTask$ValidatorErrorHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\SSHExec.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EjbJar$CMPVersion.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Handler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$SummaryAttribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Delete.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\BorlandGenerateClient.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\ClassFileUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\Scp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSConstants.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\ClearCase.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\unix\Chgrp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javacc\JavaCC.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\ClassCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCLock.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\EjbJar$DTDLocation.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javacc\JJTree.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSCHECKIN.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\script\ScriptDefBase.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ScriptRunnerHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\Jdk14RegexpMatcher.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\StringCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOS.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\XMLValidateTask$Property.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\javah\SunJavah.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\JspMangler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMklabel.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\Ildasm$VisibilityOptions.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTaskMirrorImpl.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Label$3.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Label$4.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Label$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Label$2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOSCheckout.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMkattr.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc$EjbcException.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMkdir.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\EchoProperties$FormatAttribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\FloatCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\PropertyFile$Entry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\SimpleP4OutputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\ConstantPool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\extension\ExtensionSet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\WsdlToDotnet$Schema.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sos\SOSGet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\Jdk14RegexpRegexp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\script\ScriptDef$Attribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\EchoProperties$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\IPlanetEjbc$Classname.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\HotDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\BorlandDeploymentTool$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\PropertyFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\Log4jListener.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSS.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ChainedMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\native2ascii\SunNative2Ascii.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\MimeMailer$StringDataSource.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\selectors\Majority.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\PropertyFile$Unit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Label.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\GenericDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\TraXLiaison.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMCheckout.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\WeakishReference$HardReference.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ejb\WeblogicDeploymentTool$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\IntegerCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\net\SetProxy$ProxyAuth.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\PackageNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\FormatterElement.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\SSHExec$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4OutputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMkelem.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\Xalan2Executor.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ccm\CCMCreateTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jsp\JspC.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTask$ForkMode.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\depend\bcel\DependencyVisitor.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ANTLR.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resolver\ApacheCatalog.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\AnsiColorLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\JUnitTestRunner.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RedirectingStreamHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\RCSFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\clearcase\CCMklbtype.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\SummaryJUnitResultFormatter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\SignedSelector.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Sync.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\windows\Attrib.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\Depend.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\dotnet\WsdlToDotnet$Compiler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\jdepend\JDependTask$FormatAttribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\LongCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resources\comparators\Content.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\XMLValidateTask$Attribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\script\ScriptDef.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\depend\constantpool\ConstantCPInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSS$WritableFiles.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\perforce\P4Labelsync.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ScriptRunnerCreator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\ssh\ScpFromMessageBySftp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSS$CurrentModUpdated.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\junit\DOMUtil$NodeFilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\j2ee\WebLogicHotDeploymentTool.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\vss\MSVSSCP.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\optional\sound\SoundTask$BuildAlert.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\JakartaRegexpRegexp.java