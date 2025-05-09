// lib/widgets/env_tier_tile.dart
// Widget to display one EnvironmentTier with expandable server list

import 'package:flutter/material.dart';
import '../models/environment_tier.dart';
import 'server_status_tile.dart';
import '../utils/status_chip.dart';

class EnvTierTile extends StatelessWidget {
  final EnvironmentTier tier;

  const EnvTierTile({super.key, required this.tier});

  @override
  Widget build(BuildContext context) {
    final statusList = tier.servers.map((s) => s.status).toList();
    final worstStatus = getWorstStatus(statusList);

    return ExpansionTile(
      title: Text(tier.tierName),
      trailing: buildStatusChip(worstStatus),
      children: tier.servers
          .map((server) => ServerStatusTile(server: server))
          .toList(),
    );
  }
}