// lib/models/environment_tier.dart
// Represents an environment tier (Dev, QA, Live) containing multiple servers

import 'server_status.dart';

class EnvironmentTier {
  final String tierName;               // Dev, QA, or Live
  final List<ServerStatus> servers;   // List of all servers in this tier

  EnvironmentTier({required this.tierName, required this.servers});
}