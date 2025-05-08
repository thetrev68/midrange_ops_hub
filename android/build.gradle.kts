// File: android/build.gradle.kts
// Purpose: Top-level Gradle configuration for Android-side Flutter integration.
// ----------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-07] 🍞 Introduced pluginManagement to define AGP & Kotlin versions explicitly for Gradle 8.14 compatibility.
// [2025-05-07] 📍 Added dependencyResolutionManagement to enforce consistent repo behavior across subprojects.
// [2025-05-07] 🧼 Preserved project-level buildDir redirection logic for centralized build artifacts.
// [2025-05-07] ✅ Moved to settings.gradle.kts
// [2025-05-08] 🔧 Fixed null substring error by guarding plugin versions. Confirmed plugin block executes safely with Gradle 8.14.
// [2025-05-08] 🧹 Merged subproject blocks for clarity and correctness.
// [2025-05-08] ❌ Removed redundant 'clean' task to avoid conflict with Gradle default.
// [2025-05-08] ⏳ Removed eager evaluation of ':app' to prevent premature compileSdk read error.
// [2025-05-08] 🧼 Removed root-level plugins block to prevent conflict with :app module plugins.

import org.gradle.api.initialization.resolve.RepositoriesMode
import org.gradle.api.file.Directory

// plugins block removed to avoid conflict with app module plugin declarations

// ─────────────────────────────────────────────────────────
// Set custom build output directory for cleanliness
// ─────────────────────────────────────────────────────────
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}