// File: lib/screens/tickets_screen.dart
// Purpose: Basic screen for viewing Jira tickets (mocked data for now)
// ───────────────────────────────────────────────────────────────────────────
// CHANGELOG:
// [2025-05-06] Initial scaffold with mocked list of tickets and screen layout.

import 'package:flutter/material.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView.builder(
        itemCount: 5, // Placeholder data
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.bug_report),
            title: Text('Jira Ticket #$index'),
            subtitle: const Text('Short ticket summary here'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped Ticket #$index')),
              );
            },
          );
        },
      ),
    );
  }
}