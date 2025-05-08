// File: lib/screens/support_tickets_screen.dart
// Purpose: View and filter user-submitted support tickets across teams
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-08] 🎫 Created support ticket screen with team-based tab layout.

import 'package:flutter/material.dart';

class SupportTicketsScreen extends StatelessWidget {
  const SupportTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Support Tickets'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Team A'),
              Tab(text: 'Team B'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TicketList(team: 'A'),
            _TicketList(team: 'B'),
          ],
        ),
      ),
    );
  }
}

class _TicketList extends StatelessWidget {
  final String team;

  const _TicketList({required this.team});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.confirmation_number),
          title: Text('Ticket ${index + 1}'),
          subtitle: Text('Support Team $team • Mock summary'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Team $team: Ticket ${index + 1}')),
            );
          },
        );
      },
    );
  }
}