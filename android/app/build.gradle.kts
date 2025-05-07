// File: android/app/build.gradle.kts
// Purpose: Configures the Android-side build behavior for the Flutter app
// -------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial scaffold created by Flutter tool.
// [2025-05-07] 🧠 Confirmed Kotlin DSL format (.kts).
// [2025-05-07] 🛠 Added manifestPlaceholders to define applicationName used in AndroidManifest.xml.
// [2025-05-07] 🧽 Cleaned up comments for clarity.
// [2025-05-07] ⬆️ Upgraded JVM and Kotlin target compatibility to Java 17.
// [2025-05-07] 🩹 Delayed use of `flutter.*` values until after plugin evaluation.

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Always last for Flutter
}

android {
    namespace = "com.example.midrange_ops_hub"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.midrange_ops_hub"

        // 👇 Safe placeholder values — will be overridden later
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

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

// 👇 Safely assign flutter.* values after plugin setup
afterEvaluate {
    android.compileSdk = flutter.compileSdkVersion
    android.ndkVersion = flutter.ndkVersion

    android.defaultConfig.apply {
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
}

flutter {
    source = "../.."
}