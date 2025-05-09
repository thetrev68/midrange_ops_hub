# 📋 MidRange OpsHub – Project Summary

**Date:** May 9, 2025
**Author:** ChatGPT + Trevor
**Project Purpose:** Internal mobile support app for NOV | Enterprise Solutions | Mid-Range Solutions

---

## 🧭 Project Overview

* Mobile-first Flutter app for internal ERP support workflows
* Targets Infor, Sage, Epicor environments
* Shared tools for support engineers and developers
* Branded as **MidRange OpsHub**

---

## 📱 Features Implemented

### ✅ Screens Built:

* **Tickets**

  * Jira-style issue queues
  * Support + DevOps ticket views
* **Knowledge Base**

  * ERP article list w/ summaries and tags
* **Environment Status**

  * Health/status of Dev, QA, UAT, Prod
* **Change Requests**

  * Submission, approval, and history log

---

## 🧱 Updated App Structure

```
lib/
├── api/
│   └── jira_service.dart
├── screens/
│   ├── change_requests_screen.dart
│   ├── devops_tickets_screen.dart
│   ├── env_status_screen.dart
│   ├── home_screen.dart
│   ├── kb_screen.dart
│   ├── support_tickets_screen.dart
│   └── tickets_screen.dart
├── main.dart
```

---

## 🧰 Local Development Environment

* **Flutter SDK:** Stable (3.29.3)
* **Java SDK:** Eclipse Temurin JDK 21
* **Android SDK/NDK:**

  * Build Tools: 34.0.0
  * NDK: 29.0.13113456
  * CMake: 3.22.1
* **Gradle:** Wrapper-provided (8.1+)
* **Kotlin DSL:** Used for all Gradle config files (`.kts`)
* **VS Code**:

  * Required plugin: Gradle for Java
  * `.vscode/settings.json` sets `java.home`
* **Local Properties:**

  * Required file: `android/local.properties`
  * Must include `flutter.sdk` path

---

## 🔐 Auth & Security

* **Okta OAuth2/OIDC** planned for backend auth
* **VPN (Zscaler)** required for most services
* **Security Practices**:

  * HTTPS-only endpoints
  * Role-based access
  * No secrets in mobile code or `.env`

---

## 🔄 Integrations

### Jira

* **Service Project:** User support
* **Software Projects:** CSSDO (ERP DevOps), CAPSE (Automation)
* **Accessed via:** REST API + token

### Knowledge Base

* **Sources:** Confluence, Infor/Sage/Epicor vendor data
* **Methods:** API, RSS, manual load
* **Search:** Full-text w/ tag filters

### Environments & Deploys

* Manual UI updates for env health
* Planned webhook support for auto-logging deploys

---

## 🧾 Key Files

* `pubspec.yaml` – dependencies, logo asset, lints
* `.env.example` – Jira settings (base URL, project keys)
* `.gitignore` – Flutter + Android rules
* `.github/workflows/flutter-android.yml` – CI config

---

## 🧪 Known Issues: Cert + CI

### Local Build

* ❌ Zscaler cert blocks Gradle downloads
* ⚙️ Tried importing root cert into JDK keystore
* ✅ Set `JAVA_HOME` + `gradle.properties`

  ```
  org.gradle.java.home=C:\\Program Files\\Eclipse Adoptium\\jdk-17.0.15.6-hotspot
  ```
* 🚫 Still fails locally due to trust errors

### CI Build (GitHub Actions)

* ✅ Uses `flutter-action` + `upload-artifact`
* ✅ Verifies `AndroidManifest.xml`
* ⚠️ Build fails on v1 embedding or manifest mismatch
* ✅ Kotlin folder structure corrected: `com/example/midrangeopshub/`
* ✅ Added `flutter doctor -v` for debug

---

## 🚀 CI/CD & Deployment

* **CI:** GitHub Actions
* **Artifacts:** `.apk` upload after debug build
* **Future:** Bitrise or Azure Pipelines
* **Release Targets:**

  * Android: MDM/APK
  * iOS: TestFlight (post-signing)

---

## 📈 Future Enhancements

* ✅ Jira integration via middleware
* 🚀 Firebase Crashlytics + push notifications
* 🔍 Analytics + usage reporting
* 🔖 KB tagging, bookmarks, filters
* 🔒 Okta session validation middleware
* 🏁 Tag `v0.2.0` after CI fix + APK test

---

## 🧭 Contact / Ownership

* **Project Owner:** Trevor (trevor.clark@nov.com) aka thetrev68
* **Tech Lead:** Vibe Coding (ChatGPT40 Enterprise)
* **Dev Stack:** Flutter + Dart + Firebase (planned)
* **ERP Targets:** Infor, Epicor, Sage

---

## 🔁 How to Use This Summary

This summary primes future sessions by capturing the latest structure, dependencies, CI details, and development constraints for the MidRange OpsHub Flutter app. Paste it into ChatGPT at the start of any new session to resume context instantly.

---

## 🚀 Development Quick Start (Local)

```sh
# 1. Clone repo
https://github.com/thetrev68/midrange_ops_hub.git

# 2. Set up env file
cp .env.example .env

# 3. Run project
flutter pub get && flutter run
```

---

## 📅 Last Validated On

**May 9, 2025**