// File: android/app/build.gradle.kts
// Purpose: Configures the Android-side build behavior for the Flutter app
// -------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial scaffold created by Flutter tool.
// [2025-05-07] 🧠 Confirmed Kotlin DSL format (.kts).
// [2025-05-07] 🛠 Added manifestPlaceholders to define applicationName used in AndroidManifest.xml.
// [2025-05-07] 🧽 Cleaned up comments for clarity.
// [2025-05-07] ⬆️ Upgraded JVM and Kotlin target compatibility to Java 17.

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Always last for Flutter
}

android {
    namespace = "com.example.midrange_ops_hub"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.midrange_ops_hub"
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
            signingConfig = signingConfigs.getByName("debug") // Temporary default
        }
    }
}

flutter {
    source = "../.."
}