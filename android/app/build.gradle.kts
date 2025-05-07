// File: android/app/build.gradle.kts
// Purpose: Configures the Android-side build behavior for the Flutter app
// -------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial scaffold created by Flutter tool.
// [2025-05-07] 🧠 Confirmed Kotlin DSL format (.kts).
// [2025-05-07] 🛠 Added manifestPlaceholders to define applicationName used in AndroidManifest.xml.
// [2025-05-07] 🧽 Cleaned up comments for clarity, added novice-friendly documentation.

plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle plugin (must come last)
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // App's Java/Kotlin package namespace
    namespace = "com.example.midrange_ops_hub"
    // Compile against this SDK version
    compileSdk = flutter.compileSdkVersion
    // Native development kit version
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // The unique application ID used to identify your app on the Play Store
        applicationId = "com.example.midrange_ops_hub"

        // These are passed through from Flutter's build config
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // 👇 Added to resolve ${applicationName} in AndroidManifest.xml
        manifestPlaceholders += mapOf(
            "applicationName" to "android.app.Application"
        )
    }

    buildTypes {
        release {
            // Using debug signing config for now (safe for internal apps)
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Path to your Flutter source
flutter {
    source = "../.."
}