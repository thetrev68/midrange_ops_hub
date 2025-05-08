// File: lib/screens/env_status_screen.dart
// Purpose: Displays the current status of ERP environments (Dev, QA, Prod)
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial stub with mocked environment status tiles.
// [2025-05-08] 🌐 Refactored with EnvStatus model and Chip-based status indicator.

import 'package:flutter/material.dart';

enum EnvStatusType { online, maintenance }

class EnvStatus {
  final String name;
  final EnvStatusType status;

  const EnvStatus({required this.name, required this.status});

  String get label => switch (status) {
        EnvStatusType.online => 'Online',
        EnvStatusType.maintenance => 'Maintenance'
      };

  Color get color => switch (status) {
        EnvStatusType.online => Colors.green,
        EnvStatusType.maintenance => Colors.orange
      };
}

class EnvStatusScreen extends StatelessWidget {
  const EnvStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const environments = [
      EnvStatus(name: 'Dev', status: EnvStatusType.online),
      EnvStatus(name: 'QA', status: EnvStatusType.maintenance),
      EnvStatus(name: 'UAT', status: EnvStatusType.online),
      EnvStatus(name: 'Prod', status: EnvStatusType.online),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Status'),
      ),
      body: ListView.builder(
        itemCount: environments.length,
        itemBuilder: (context, index) {
          final env = environments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: Icon(Icons.cloud, color: env.color),
              title: Text(env.name),
              subtitle: Row(
                children: [
                  Chip(
                    label: Text(env.label),
                    backgroundColor: env.color.withAlpha((255 * 0.15).toInt()),
                    labelStyle: TextStyle(color: env.color),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${env.name} details coming soon')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}