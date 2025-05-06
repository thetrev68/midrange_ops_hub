// File: lib/screens/change_requests_screen.dart
// Purpose: Stub for viewing and managing change requests
// ───────────────────────────────────────────────────────────────────────────
// CHANGELOG:
// [2025-05-06] Initial stub showing mock list of change requests.

import 'package:flutter/material.dart';

class ChangeRequestsScreen extends StatelessWidget {
  const ChangeRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> changeRequests = [
      {'id': 'CR-1042', 'status': 'Pending', 'summary': 'Deploy hotfix to AP batch posting'},
      {'id': 'CR-1039', 'status': 'Approved', 'summary': 'Add field validation to vendor master'},
      {'id': 'CR-1037', 'status': 'Rejected', 'summary': 'Extend timeout on UAT login screen'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Requests'),
      ),
      body: ListView.builder(
        itemCount: changeRequests.length,
        itemBuilder: (context, index) {
          final cr = changeRequests[index];
          return ListTile(
            leading: const Icon(Icons.change_circle),
            title: Text('${cr['id']} - ${cr['summary']}'),
            subtitle: Text('Status: ${cr['status']}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped: ${cr['id']}')),
              );
            },
          );
        },
      ),
    );
  }
}