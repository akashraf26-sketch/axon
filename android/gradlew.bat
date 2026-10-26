@echo off
set DIR=%~dp0
if "%DIR%"=="" set DIR=.

set APP_HOME=%DIR%
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

if not exist "%CLASSPATH%" (
  echo ERROR: Gradle wrapper JAR missing. Run "flutter pub get" or regenerate the wrapper.
  exit /b 1
)

java -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*
