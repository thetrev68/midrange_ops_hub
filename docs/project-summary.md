
# 📋 MidRange OpsHub – Project Summary

**Date:** May 6, 2025  
**Author:** ChatGPT + Trevor  
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

\`\`\`
lib/
├── main.dart
├── screens/
│   ├── tickets_screen.dart
│   ├── kb_screen.dart
│   ├── env_status_screen.dart
│   └── change_requests_screen.dart
├── widgets/
└── services/
\`\`\`

---

## 🧰 Project Configuration

### 🔧 Dart & Flutter

- SDK: Flutter stable 3.19.0
- JDK: Eclipse Temurin (Adoptium) JDK 17

### 🧾 Key Files

- \`pubspec.yaml\` – uses \`flutter_lints\`, includes NOV logo asset  
- \`analysis_options.yaml\` – follows project annotation/changelog conventions  
- \`.metadata\` – Flutter-generated, annotated  
- \`.gitignore\` – merged for Flutter + Android  

---

## 🔐 Cert & Network Workaround

### 🧱 Problem

Gradle downloads failed with:  
\`PKIX path building failed: unable to find valid certification path\`

### 🛠 Fix Attempted

- Exported root cert from Zscaler  
- Imported cert into:  
  \`C:\\Program Files\\Eclipse Adoptium\\jdk-17.0.15.6-hotspot\\lib\\security\\cacerts\`  
- Set \`JAVA_HOME\` + updated \`gradle.properties\`:

\`\`\`properties
org.gradle.java.home=C:\\\\Program Files\\\\Eclipse Adoptium\\\\jdk-17.0.15.6-hotspot
\`\`\`

### 🚫 Result

- Local build still failed—Gradle unable to fully bypass Zscaler

---

## ✅ GitHub Actions: CI Build Setup

### 🌐 Workflow Path

\`.github/workflows/flutter-android.yml\`

### ✅ What it does:

- Runs \`flutter pub get\` + \`flutter build apk --debug\`  
- Uploads \`.apk\` as an artifact

### ✅ Actions Used

- \`subosito/flutter-action@v2\`  
- \`actions/upload-artifact@v4\`

---

## 🚀 Next Steps

- Confirm GitHub Actions build works + download \`.apk\`  
- Add detail views per screen  
- Connect real Jira data  
- Tag \`v0.2.0\` after first successful cloud build  
- Optional: Add release signing, Play Store deployment

---

## 🧭 Contact / Ownership

- **Project Owner:** Trevor  
- **Tech Lead:** Vibe Coding (ChatGPT40)  
- **Dev Stack:** Flutter + Dart + Firebase (planned)  
- **Auth:** Okta (planned)  
- **ERP Targets:** Infor, Epicor, Sage  

---
EOF