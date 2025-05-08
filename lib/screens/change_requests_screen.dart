// File: lib/screens/change_requests_screen.dart
// Purpose: Displays a list of change requests and their approval status
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial stub showing mock list of change requests.
// [2025-05-08] 🔁 Merged typed model and enum status with original ID + summary formatting.

import 'package:flutter/material.dart';

enum ChangeStatus { pending, approved, rejected }

class ChangeRequest {
  final String id;
  final String summary;
  final ChangeStatus status;

  const ChangeRequest({
    required this.id,
    required this.summary,
    required this.status,
  });

  Color get statusColor => switch (status) {
        ChangeStatus.pending => Colors.amber,
        ChangeStatus.approved => Colors.green,
        ChangeStatus.rejected => Colors.red,
      };

  String get label => switch (status) {
        ChangeStatus.pending => 'Pending',
        ChangeStatus.approved => 'Approved',
        ChangeStatus.rejected => 'Rejected',
      };
}

class ChangeRequestsScreen extends StatelessWidget {
  const ChangeRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const requests = [
      ChangeRequest(id: 'CR-1042', summary: 'Deploy hotfix to AP batch posting', status: ChangeStatus.pending),
      ChangeRequest(id: 'CR-1039', summary: 'Add field validation to vendor master', status: ChangeStatus.approved),
      ChangeRequest(id: 'CR-1037', summary: 'Extend timeout on UAT login screen', status: ChangeStatus.rejected),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Requests'),
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(Icons.change_circle, color: req.statusColor),
              title: Text('${req.id} - ${req.summary}'),
              subtitle: Text('Status: ${req.label}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped: ${req.id}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}