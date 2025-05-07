// File: android/settings.gradle.kts
// Purpose: Configure plugin management, Flutter includeBuild, and repo resolution
// ----------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-07] 🧠 Merged Flutter-specific includeBuild and plugin setup into fixed settings layout.

pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    // 👇 Required to include Flutter's Gradle tools
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

// 👇 Project metadata and modules
rootProject.name = "midrange_ops_hub"
include(":app")