@echo off

REM You will need to specify JAVA_HOME if compiling with 1.2 or later.

REM    Copyright (c) 2000-2003 The Apache Software Foundation.  All rights
REM    reserved.

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

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\bzip2\*.java %TOOLS%\tar\*.java %TOOLS%\zip\*.java %TOOLS%\ant\*.java %TOOLS%\ant\types\*.java %TOOLS%\ant\taskdefs\*.java %TOOLS%\ant\util\regexp\RegexpMatcher.java %TOOLS%\ant\util\regexp\RegexpMatcherFactory.java %TOOLS%\ant\taskdefs\condition\*.java %TOOLS%\ant\taskdefs\compilers\*.java 

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\cvslib\*.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\ConcatFilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\MailLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\WeakishReference.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\StringInputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\regexp\RegexpUtil.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\loader\AntClassLoader2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\UUMailer.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\UnPackageNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\LazyHashTable.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\modifiedselector\HashvalueAlgorithm.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\TaskLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\PackageNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\input\PropertyFileInputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\KeepAliveOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\RegexpPatternMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\listener\AnsiColorLogger.java

"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\util\JavaClassHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ScriptRunner.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resolver\ApacheCatalogResolver.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\resolver\ApacheCatalog.java


"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$TagArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Mkdir.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SubAnt.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Replace$NestedString.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Exec$StreamPumper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$DocletParam.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$SourceFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Untar$UntarCompressionMethod.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\LoadFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$AntHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\DefaultCompilerAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\input\DefaultInputHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$DescriptionHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$GroupArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$DocletInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Rmic$ImplementationSpecificArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Move.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\facade\ImplementationSpecificArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$LinkArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\CollectionUtils$EmptyEnumeration.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTLoggerAware.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Untar.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$Html.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Sequential.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Parallel$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTProcess$Factory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTProcess$OutputProperty.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Touch.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$AccessType.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\TaskOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\GenerateKey$DistinguishedName.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$TaskHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Sleep.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SignJar.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\GUnzip.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tar$TarFileSet.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\WhichResource.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTProcess.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Typedef.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\LoadProperties.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\CompilerAdapterFactory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\AntXMLContext.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\modifiedselector\EqualComparator.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\JikesOutputParser.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\WLRmic.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Jikes.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\DefaultRmicAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tar$TarCompressionMethod.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Sync.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tar.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\ManifestException.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\JAXPUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\TempFile.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\ExecuteJava.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javac$ImplementationSpecificArgument.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroInstance$Element.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\ManifestTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\EmailTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTLiaison2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\LazyFileOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\DemuxOutputStream$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Jikes.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Get.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\email\EmailTask$Encoding.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Sj.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\JDBCTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Parallel.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tstamp$Unit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\PathConvert.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Rename.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Filter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTLogger.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\MergingMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\GenerateKey$DnameParam.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Jvc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTProcess$Param.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\ManifestTask$Mode.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Patch.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tar$TarLongFileMode.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$RootHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Manifest$Section.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$ExtensionInfo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroDef$Attribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\modifiedselector\DigestAlgorithm.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\GenerateKey.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\SourceFileScanner.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTLiaison.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\War.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$RootHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\filters\util\ChainReaderHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\KeepAliveInputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\TeeOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$DataTypeHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Sync$MyCopy.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Parallel$TaskList.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\PreSetDef.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\CollectionUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Get$Base64Converter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XSLTProcess$Factory$Attribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$JavadocOutputStream.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\SunRmic.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SQLExec$DelimiterType.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Javac12.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Javac13.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tstamp.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$ProjectHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\XmlProperty.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\SelectorUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Echo.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Input.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\facade\FacadeTaskHelper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\RecorderEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\WaitFor.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Java.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\types\selectors\modifiedselector\PropertiesfileCache.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\IdentityMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\RmicAdapterFactory.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\DefaultRmicAdapter$RmicFileNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Recorder.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\ResourceUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroInstance.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Replace$Replacefilter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Echo$EchoLevel.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$ElementHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\KaffeRmic.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SQLExec$OnError.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\LogStreamHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Recorder$ActionChoices.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$TargetHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Exec.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$NestedElementHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Replace.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SQLExec.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\KeySubst.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\WaitFor$Unit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroDef$MyAntTypeDefinition.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Expand.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Gcj.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Transform.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Parallel$TaskRunnable.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$ProjectHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\DOMElementWriter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\ImportTask.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Rmic.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\PathConvert$TargetOs.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\rmic\RmicAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javadoc$PackageName.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroDef$TemplateElement.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SendEmail.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\PreSetDef$PreSetDefinition.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$TargetHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\SQLExec$Transaction.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Javac.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Get$1.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\Kjc.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\JavacExternal.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\PathConvert$MapEntry.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\LoaderUtils.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Tstamp$CustomFormat.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Manifest$Attribute.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelperImpl$AbstractHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Manifest.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Exit.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\helper\ProjectHelper2$MainHandler.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Taskdef.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroDef$NestedSequential.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\util\FlatFileNameMapper.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\GZip.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\Recorder$VerbosityLevelChoices.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\input\MultipleChoiceInputRequest.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\compilers\CompilerAdapter.java
"%JAVAC%" %BOOTJAVAC_OPTS% -d %CLASSDIR% %TOOLS%\ant\taskdefs\MacroDef.java


