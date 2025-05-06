// File: lib/screens/env_status_screen.dart
// Purpose: Displays the current status of ERP environments (Dev, QA, Prod)
// ───────────────────────────────────────────────────────────────────────────
// CHANGELOG:
// [2025-05-06] Initial stub with mocked environment status tiles.

import 'package:flutter/material.dart';

class EnvStatusScreen extends StatelessWidget {
  const EnvStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> environments = [
      {'name': 'Dev', 'status': 'Online'},
      {'name': 'QA', 'status': 'Maintenance'},
      {'name': 'UAT', 'status': 'Online'},
      {'name': 'Prod', 'status': 'Online'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Status'),
      ),
      body: ListView.builder(
        itemCount: environments.length,
        itemBuilder: (context, index) {
          final env = environments[index];
          final color = env['status'] == 'Online' ? Colors.green : Colors.orange;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: Icon(Icons.cloud, color: color),
              title: Text(env['name']!),
              subtitle: Text('Status: ${env['status']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${env['name']} details coming soon')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}