// lib/models/environment_group.dart
// Represents a group like "Syteline 9.00.30 CTS" that contains all tiers

import 'environment_tier.dart';

class EnvironmentGroup {
  final String name;                      // Full name of the environment
  final String system;                   // ERP type: Syteline, Epicor, etc.
  final List<EnvironmentTier> tiers;     // Dev/QA/Live groupings

  EnvironmentGroup({required this.name, required this.system, required this.tiers});
}