// File: android/settings.gradle.kts
// Purpose: Configure plugin repositories and resolution rules for all Android builds
// ----------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-07] 🧱 Initial pluginManagement + dependencyResolutionManagement setup
// [2025-05-07] 🪤 Relaxed repositoriesMode to PREFER_SETTINGS to allow Flutter plugin to add maven()

pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val sdk = properties.getProperty("flutter.sdk")
        require(sdk != null) { "flutter.sdk not set in local.properties" }
        sdk
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    // 👇 Allow plugins (like Flutter) to add their own repositories without crashing the build
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)

    repositories {
        google()
        mavenCentral()
    }
}

include(":app")