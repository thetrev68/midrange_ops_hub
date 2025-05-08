# 🛠️ Development Setup for MidRange OpsHub

This guide ensures cross-machine consistency for Android + Flutter development.

---

## ✅ Prerequisites

- **Flutter SDK** (channel `stable`)
- **Android Studio** (Hedgehog or later)
- **Android SDK Build Tools**: `34.0.0`
- **Android NDK**: `29.0.13113456`
- **Java**: JDK 21 (Eclipse Temurin preferred)
- **CMake**: `3.22.1` (installed automatically)

---

## 🧭 Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/thetrev68/midrange-ops_hub.git
   cd midrange-opshub
   ```

2. Run Flutter dependency install:
   ```bash
   flutter pub get
   ```

3. Create `android/local.properties` with:
   ```properties
   flutter.sdk=/path/to/flutter
   ```
   > ⚠️ Do not commit this file. It's machine-specific.

4. Open the project in Android Studio and let it install any missing SDK components.

5. Set `JAVA_HOME` to JDK 21 if not already:
   ```bash
   export JAVA_HOME="/path/to/jdk-21"
   ```

6. Build the Android project:
   ```bash
   cd android
   ./gradlew clean build
   ```

---

## 📂 Tracked Files That Affect Builds

- `android/settings.gradle.kts`
- `android/build.gradle.kts`
- `android/app/build.gradle.kts`
- `.vscode/settings.json` (contains Java path)
- `gradle/wrapper/gradle-wrapper.properties`

> ✅ Confirm these are committed to ensure consistent build behavior.
