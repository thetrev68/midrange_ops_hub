// File: android/build.gradle.kts
// Purpose: Top-level Gradle configuration for Android-side Flutter integration.
// ----------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-07] 📦 Introduced pluginManagement to define AGP & Kotlin versions explicitly for Gradle 8.14 compatibility.
// [2025-05-07] 📍 Added dependencyResolutionManagement to enforce consistent repo behavior across subprojects.
// [2025-05-07] 🧼 Preserved project-level buildDir redirection logic for centralized build artifacts.
// [2025-05-07] ✅ Moved to settings.gradle.kts

import org.gradle.api.initialization.resolve.RepositoriesMode
import org.gradle.api.file.Directory

// ─────────────────────────────────────────────────────────────────────────────
// 1. Define plugin versions here to ensure compatibility with Gradle 8.14
// ─────────────────────────────────────────────────────────────────────────────
// pluginManagement {
//     repositories {
//         google()
//         gradlePluginPortal()
//         mavenCentral()
//     }                    // ************Trevor: Moved to settings.gradle.kts
    plugins {
        // Android Gradle Plugin (AGP) 8.2.1 - required for compatibility with Gradle 8.14
        id("com.android.application") version "8.2.1"
        // Kotlin Android Plugin - version 1.9.22 is safe for AGP 8.2.x
        id("org.jetbrains.kotlin.android") version "1.9.22"
    }
// }

// ─────────────────────────────────────────────────────────────────────────────
// 2. Repository resolution mode and sources for all subprojects
// ─────────────────────────────────────────────────────────────────────────────
// dependencyResolutionManagement {
//     repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
//     repositories {
//         google()
//         mavenCentral()
//     }
// }                    // ************Trevor: Moved to settings.gradle.kts

// ─────────────────────────────────────────────────────────────────────────────
// 3. Set custom build output directory for cleanliness
// ─────────────────────────────────────────────────────────────────────────────
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Each subproject's build directory will mirror the parent one
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Flutter requires this line to resolve dependencies for :app
subprojects {
    project.evaluationDependsOn(":app")
}

// Clean task deletes all build artifacts from the shared build dir
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}