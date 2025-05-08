@echo off
REM File: build-android.bat
REM Purpose: Ensure consistent Java version and build Android app using Gradle
REM ----------------------------------------------------------------------------------
REM CHANGELOG:
REM [2025-05-08] ✅ Verified Java 21 setup and Gradle build behavior for midrange_ops_hub

REM Set Java version path (ensure this matches installed JDK)
SET "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.7.6-hotspot"
SET "PATH=%JAVA_HOME%\bin;%PATH%"

REM Show version confirmation
echo Using JAVA_HOME: %JAVA_HOME%
java -version

REM Navigate to Android project directory
SET "PROJECT_ROOT=C:\Repos\midrange_ops_hub"
SET "ANDROID_DIR=%PROJECT_ROOT%\android"
cd /d "%ANDROID_DIR%"

REM Run clean build
call gradlew.bat clean build

REM Error handling
if %errorlevel% neq 0 (
    echo ❌ Build failed. See errors above.
    exit /b %errorlevel%
) else (
    echo ✅ Build succeeded.
)

pause