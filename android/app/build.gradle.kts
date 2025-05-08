// File: android/app/build.gradle.kts
// Purpose: Configures the Android-side build behavior for the Flutter app
// -------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial scaffold created by Flutter tool.
// [2025-05-07] 🧠 Confirmed Kotlin DSL format (.kts).
// [2025-05-07] 🛠️ Added manifestPlaceholders to define applicationName used in AndroidManifest.xml.
// [2025-05-07] 🧹 Cleaned up comments for clarity.
// [2025-05-07] ⬆️ Upgraded JVM and Kotlin target compatibility to Java 17.
// [2025-05-07] 🩹 Delayed use of `flutter.*` values until after plugin evaluation.
// [2025-05-08] ✅ Refactored to set compileSdk and versionCode eagerly to fix AGP 8+ compatibility errors.
// [2025-05-08] 🔧 Updated ndkVersion to 29.0.13113456 after NDK installation via Android Studio.
// [2025-05-08] ❌ Removed duplicate 'clean' task definition to prevent task conflict.
// [2025-05-08] 🔍 Added debug println to confirm app module is evaluated
// [2025-05-08] 🧱 Added google() and mavenCentral() repositories for runtime resolution
// [2025-05-08] 🧬 Updated namespace and applicationId to match Kotlin package 'com.example.midrangeopshub'.

println("✅ android/app/build.gradle.kts has been loaded")

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin") // Always last for Flutter
}

android {
    namespace = "com.example.midrangeopshub"

    // ✅ Required early to avoid Gradle sync errors with AGP 8+
    compileSdk = 34
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.midrangeopshub"

        // ✅ Use Flutter-injected values early to prevent sync-time errors
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        manifestPlaceholders += mapOf(
            "applicationName" to "android.app.Application"
        )
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

repositories {
    google()
    mavenCentral()
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.22")
}