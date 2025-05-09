# 🧾 CHANGELOG

## 🏁 v0.3.0 – Environment Status Module (2025-05-09)

### ✨ Features
- Added complete support for environment monitoring:
  - Environment Groups (e.g., Syteline, Epicor)
  - Expandable tiers: Dev, QA, Live
  - Server-level rows with role and IP
- Detail view per server:
  - Status, role, uptime, last reboot
  - Simulated performance metrics (CPU, memory, disk)
  - Line charts for historical usage via `fl_chart`

### 🧱 Architecture Improvements
- Refactored UI into modular components:
  - `env_group_tile`, `env_tier_tile`, `server_status_tile`, `status_chip`
- Separated mock data to `mock_environment_data.dart`

### ⚠️ Known Gaps
- No real-time polling yet
- Charts show generated values only
- No API integration or refresh interval

---
