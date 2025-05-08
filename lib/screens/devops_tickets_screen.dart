// File: lib/screens/devops_tickets_screen.dart
// Purpose: Displays DevOps tickets for specified Jira project
// ------------------------------------------------------------------------------
// [2025-05-08] 🧹 Made subtitle Text const to resolve linter warning
// [2025-05-08] 🧹 Added const constructor to resolve linter warning
// [2025-05-08] 🛠️ Scaffolded DevOps ticket screen with project key injection.

import 'package:flutter/material.dart';

class DevOpsTicketsScreen extends StatelessWidget {
  final String projectKey;

  const DevOpsTicketsScreen({super.key, required this.projectKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevOps – $projectKey'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code),
            title: Text('$projectKey Ticket ${index + 1}'),
            subtitle: const Text('Mock Kanban ticket details here'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tapped DevOps Ticket')),
              );
            },
          );
        },
      ),
    );
  }
}