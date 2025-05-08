// File: lib/screens/tickets_screen.dart
// Purpose: Ticket hub screen to select between Support and DevOps queues
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial scaffold with mocked list of tickets and screen layout.
// [2025-05-08] 🔁 Refactored into navigation hub for Support and DevOps ticket views.

import 'package:flutter/material.dart';
import 'support_tickets_screen.dart';
import 'devops_tickets_screen.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView(
        children: [
          _buildTile(
            context,
            'Support Tickets',
            Icons.support_agent,
            const SupportTicketsScreen(),
            'User-submitted help desk issues'
          ),
          _buildTile(
            context,
            'DevOps – CSSDO',
            Icons.developer_board,
            const DevOpsTicketsScreen(projectKey: 'CSSDO'),
            'Kanban: Engineering tasks and changes'
          ),
          _buildTile(
            context,
            'DevOps – CAPSE',
            Icons.developer_board,
            const DevOpsTicketsScreen(projectKey: 'CAPSE'),
            'Kanban: Process engineering and automation'
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, IconData icon, Widget screen, String subtitle) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
    );
  }
}