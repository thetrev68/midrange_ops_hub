// lib/utils/status_chip.dart
// Shared utility to build status chips for server health

import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'online':
      return Colors.green;
    case 'warning':
      return Colors.orange;
    case 'offline':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

String getWorstStatus(List<String> statuses) {
  if (statuses.any((s) => s.toLowerCase() == 'offline')) {
    return 'Offline';
  } else if (statuses.any((s) => s.toLowerCase() == 'warning')) {
    return 'Warning';
  } else if (statuses.any((s) => s.toLowerCase() == 'online')) {
    return 'Online';
  } else {
    return 'Unknown';
  }
}

Widget buildStatusChip(String status) {
  final color = getStatusColor(status);
  return Chip(
    label: Text(status),
    backgroundColor: color.withOpacity(0.2),
    labelStyle: TextStyle(color: color),
  );
}