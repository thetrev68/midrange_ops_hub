// lib/models/server_status.dart
// Represents the status of an individual server (SQL, App, Reports, etc.)

enum ServerRole { sql, app, utility, reports, unknown }

class ServerStatus {
  final String name;        // Human-friendly name of the server
  final ServerRole role;    // Role/type of the server
  final String ip;          // IP address (for reference)
  final String status;      // Status string like "Online", "Warning", "Offline"
  final DateTime lastChecked; // Timestamp of last known status

  ServerStatus({
    required this.name,
    required this.role,
    required this.ip,
    required this.status,
    required this.lastChecked,
  });
}