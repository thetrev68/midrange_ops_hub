@echo off
REM Set Java version
SET "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.7.6-hotspot"
SET "PATH=%JAVA_HOME%\bin;%PATH%"

REM Show version
echo Using JAVA_HOME: %JAVA_HOME%
java -version

REM Set your project path here
SET "PROJECT_ROOT=C:\Repos\midrange_ops_hub"
SET "ANDROID_DIR=%PROJECT_ROOT%\android"

cd /d "%ANDROID_DIR%"
call gradlew.bat clean build

pause