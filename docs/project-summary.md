# 📋 MidRange OpsHub – Project Summary

**Date:** May 6, 2025\
**Author:** ChatGPT + Trevor\
**Project Purpose:** Internal mobile support app for NOV | Enterprise Solutions | Mid-Range Solutions

---

## 🧭 Project Overview

- Mobile-first Flutter app for internal ERP support workflows
- Targets Infor, Sage, Epicor environments
- Shared tools for support engineers and developers
- Branded as **MidRange OpsHub**

---

## 📱 Features Implemented

### ✅ Screens Built:

- **Tickets**
  - Mocked Jira-style issue list
- **Knowledge Base**
  - ERP article list w/ summaries
- **Environment Status**
  - Health/status of Dev, QA, UAT, Prod
- **Change Requests**
  - List of mock change requests by ID and status

---

### 🧱 App Structure:

```
lib/
├── main.dart
├── screens/
│   ├── tickets_screen.dart
│   ├── kb_screen.dart
│   ├── env_status_screen.dart
│   └── change_requests_screen.dart
├── widgets/
└── services/
```

---

## 🧰 Project Configuration

### 🔧 Dart & Flutter

- SDK: Flutter stable 3.19.0
- JDK: Eclipse Temurin (Adoptium) JDK 17

### 🧾 Key Files

- `pubspec.yaml` – uses `flutter_lints`, includes NOV logo asset
- `analysis_options.yaml` – follows project annotation/changelog conventions
- `.metadata` – Flutter-generated, annotated
- `.gitignore` – merged for Flutter + Android

---

## 🔐 Cert & Network Workaround

### 🧱 Problem (Local Only)

Gradle downloads failed with: `PKIX path building failed: unable to find valid certification path`

### 🛠 Fix Attempted

- Exported root cert from Zscaler
- Imported cert into: `C:\Program Files\Eclipse Adoptium\jdk-17.0.15.6-hotspot\lib\security\cacerts`
- Set `JAVA_HOME` + updated `gradle.properties`

```properties
org.gradle.java.home=C:\\Program Files\\Eclipse Adoptium\\jdk-17.0.15.6-hotspot
```

### 🚫 Result

- Local build still failed—Gradle unable to fully bypass Zscaler
- **CI Build intended to bypass this (Option A), but fails for different reasons**

---

## ✅ GitHub Actions: CI Build Setup

### 🌐 Workflow Path

`.github/workflows/flutter-android.yml`

### ✅ What it does:

- Runs `flutter pub get` + `flutter build apk --debug`
- Uploads `.apk` as an artifact

### ✅ Actions Used

- `subosito/flutter-action@v2`
- `actions/upload-artifact@v4`  <!-- Updated to v4 to fix deprecated v3 issue -->

### 🛡️ Sanity Check

<!-- File: .github/workflows/flutter-android.yml -->
<!-- CHANGELOG:
     [2025-05-06] Added pre-check for AndroidManifest.xml to fail fast if missing.
     [2025-05-06] Discovered manifest build failure due to Kotlin package path mismatch.
     [2025-05-06] CI build fails despite v2 embedding due to project root misalignment or misconfiguration.
     [2025-05-06] Added `flutter doctor -v` debug step to inspect environment during CI. -->

```yaml
- name: Check for AndroidManifest.xml
  run: |
    if [ ! -f android/app/src/main/AndroidManifest.xml ]; then
      echo "::error file=android/app/src/main/AndroidManifest.xml::Missing AndroidManifest.xml. Ensure android/ folder is committed."
      exit 1
    fi

- name: Run flutter doctor
  run: flutter doctor -v
```

#### 📌 Notes:
- The package name in `AndroidManifest.xml` (e.g., `com.example.midrangeopshub`) **must match** the Kotlin folder structure.
- ✅ Folder corrected to `com/example/midrangeopshub/`
- ❗ CI build still fails with v1 embedding warning — likely cause: **GitHub Actions is misaligned in its working directory or structure**
- 🧪 `flutter doctor -v` output added to analyze runner's environment

---

## 🚀 Next Steps

- Validate project structure and CI root context
- Confirm GitHub Actions build works + download `.apk`
- Add detail views per screen
- Connect real Jira data
- Tag `v0.2.0` after first successful cloud build
- Optional: Add release signing, Play Store deployment

---

## 🧭 Contact / Ownership

- **Project Owner:** Trevor  
- **Tech Lead:** Vibe Coding (external)  
- **Dev Stack:** Flutter + Dart + Firebase (planned)  
- **Auth:** Okta (planned)  
- **ERP Targets:** Infor, Epicor, Sage

---

Let me know if you want a version for `README.md`, a tagged release, or an artifact link generator script for the `.apk` downloads.