# ERP Support Companion App – High-Level Architecture

## 🎯 Overview
A mobile-first internal app to streamline ERP support workflows across teams. Integrates Jira (Service + Software projects), connects to multiple ERP KB sources (Infor, Sage, Epicor), and provides a unified status + change tracking interface.

---

## 🧰 Local Development Environment

- **Java SDK**: Java 21 (Temurin preferred)
- **Flutter SDK**: Stable channel
- **Android SDK/NDK**:
  - Build Tools: 34.0.0
  - NDK: 29.0.13113456
  - CMake: 3.22.1 (auto-installed)
- **Gradle**: Wrapper-provided (8.14)
- **Project Language**: Kotlin DSL (`build.gradle.kts`)
- **VS Code**:
  - Required plugin: Gradle for Java
  - `.vscode/settings.json` sets `java.home` for Gradle compatibility
- **Local Properties**:
  - Required file: `android/local.properties`
  - Must include: `flutter.sdk=/your/path/to/flutter`

See `SETUP.md` for complete environment setup instructions.

---

## 🧱 Architecture Components

### 1. Mobile App (Frontend)
- **Tech**: Flutter or React Native
- **Functions**:
  - Ticket management (view, create, update Jira issues)
  - KB search and view (Confluence + vendor sources)
  - Deploy/environment status dashboard
  - Change request submission/approval

### 2. Backend API (Middleware)
- **Tech**: Node.js (Express) or Python (FastAPI)
- **Functions**:
  - REST API for mobile app
  - Integrates with Jira APIs
  - Pulls KB data from Confluence + vendor sources
  - Stores environment/deploy metadata
  - Handles Okta auth session validation

### 3. Database
- **DB**: Microsoft SQL Server
- **Stores**:
  - Cached KB articles
  - User profiles/roles
  - Environment and deploy logs
  - Change requests and approvals

---

## 🔐 Authentication & Security

- **Auth Provider**: Okta (OAuth2 / OIDC)
- **VPN**: Zscaler VPN or API Gateway required for internal access
- **Security**:
  - All endpoints behind HTTPS
  - Role-based access control
  - Secure token/session management

---

## 🔄 Integrations

### Jira
- **Service Project**: Support/help desk
- **Software Project**: DevOps, releases, deploys
- **Access**: Jira REST API using API tokens

### Knowledge Base
- **Sources**:
  - Internal: Confluence via API
  - Vendor: Infor, Sage, Epicor via RSS, manual upload, or scraping
- **Search**:
  - Full-text index with tags by ERP/module

### Environments & Deploys
- **Manual UI** for marking environments up/down
- **Optional Webhooks** for auto-logging deploys (from GitHub/GitLab)

---

## 📂 Ticket Management Structure

The app supports both internal support queues and DevOps Jira projects:

### 1. Support Tickets
- **Source**: Jira Service Project (Help Desk)
- **Split by team**: e.g., Team A and Team B
- **UI**: `SupportTicketsScreen` with tabbed layout for team views
- **Usage**: Tracks incoming user-submitted support requests

### 2. DevOps Tickets
- **Source**: Jira Software Projects (Kanban)
- **Project Keys**:
  - `CSSDO`: Core ERP/Systems DevOps
  - `CAPSE`: Process Automation Engineering
- **UI**: `DevOpsTicketsScreen(projectKey: ...)`
- **Usage**: View active work in engineering pipelines by team

**Accessed Via**: Main hub `TicketsScreen` with routes to each queue

---

## 🚀 DevOps & Deployment

- **Hosting**:
  - API: Azure App Services / On-prem with Zscaler
  - DB: SQL Server instance
- **CI/CD**:
  - GitHub Actions, Bitrise, or Azure Pipelines
  - App deploy via TestFlight (iOS), MDM/APK (Android)
- **Monitoring**:
  - Firebase Crashlytics (mobile)
  - Logging to SQL or file (backend)

---

## 📈 Future Enhancements
- Usage analytics dashboard
- Push notifications (Firebase)
- Gamification for KB contributions
- Bookmarking, saved search filters