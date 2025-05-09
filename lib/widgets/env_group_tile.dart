// lib/widgets/env_group_tile.dart
// Widget to display one EnvironmentGroup with expandable tiers

import 'package:flutter/material.dart';
import '../models/environment_group.dart';
import 'env_tier_tile.dart';
import '../utils/status_chip.dart';

class EnvGroupTile extends StatelessWidget {
  final EnvironmentGroup group;

  const EnvGroupTile({super.key, required this.group});

  
  @override
  Widget build(BuildContext context) {
    final allStatuses = group.tiers.expand((tier) => tier.servers.map((s) => s.status)).toList();
    final worstStatus = getWorstStatus(allStatuses);

    return ExpansionTile(
      title: Text(group.name),
      subtitle: Text(group.system),
      trailing: buildStatusChip(worstStatus),
      children: group.tiers
          .map((tier) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: EnvTierTile(tier: tier),
              ))
          .toList(),
    );
  }
}