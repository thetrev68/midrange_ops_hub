// File: android/settings.gradle.kts
// Purpose: Configure plugin repositories and resolution rules for all Android builds
// ----------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-07] 🧱 Initial pluginManagement + dependencyResolutionManagement setup
// [2025-05-07] 🪤 Relaxed repositoriesMode to PREFER_SETTINGS to allow Flutter plugin to add maven()
// [2025-05-08] ✅ Declared app module build file as Kotlin DSL (build.gradle.kts)
// [2025-05-08] 📦 Declared plugin versions for Kotlin DSL compatibility
// [2025-05-08] 🧩 Added Flutter local maven repo for native artifact resolution
// [2025-05-08] ➕ Added Flutter local repo to dependencyResolutionManagement to resolve native dependencies
// [2025-05-08] 🧼 Cleaned and corrected pluginManagement block structure

enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")

rootProject.name = "midrange_ops_hub"

pluginManagement {
    plugins {
        id("com.android.application") version "8.2.1"
        id("org.jetbrains.kotlin.android") version "1.9.22"
    }

    val flutterSdkPath = file("local.properties").inputStream().use {
        val props = java.util.Properties().apply { load(it) }
        props.getProperty("flutter.sdk") ?: error("flutter.sdk not set")
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    val flutterRoot = file("local.properties").inputStream().use {
        val props = java.util.Properties().apply { load(it) }
        props.getProperty("flutter.sdk") ?: error("flutter.sdk not set")
    }

    repositories {
        google()
        mavenCentral()
        maven {
            url = uri("$flutterRoot/packages/flutter_tools/gradle/m2repository")
        }
    }
}

include(":app")
project(":app").buildFileName = "build.gradle.kts"