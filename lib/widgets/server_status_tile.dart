// lib/widgets/server_status_tile.dart
// Widget to display a server's name, role, IP, and status chip

import 'package:flutter/material.dart';
import '../models/server_status.dart';
import '../utils/status_chip.dart';
import '../screens/server_detail_screen.dart';

class ServerStatusTile extends StatelessWidget {
  final ServerStatus server;

  const ServerStatusTile({super.key, required this.server});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.computer),
      title: Text(server.name),
      subtitle: Text('${server.role.name.toUpperCase()} - ${server.ip}'),
      trailing: buildStatusChip(server.status),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ServerDetailScreen(server: server)),
      ),
    );
  }
}