// File: lib/api/jira_service.dart
// Purpose: Handles Jira API calls for both support and DevOps ticket sources
// ------------------------------------------------------------------------------
// [2025-05-08] 🧹 Removed unused import 'foundation.dart' to resolve analyzer warning
// [2025-05-08] 🔐 Initialized Jira service with placeholder support for Okta MFA session-based auth.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JiraService {
  final String baseUrl = dotenv.env['JIRA_BASE_URL'] ?? '';

  Future<List<JiraTicket>> fetchTickets({required String projectKey}) async {
    final uri = Uri.parse('$baseUrl/rest/api/2/search?jql=project=$projectKey ORDER BY updated DESC');

    final headers = {
      'Accept': 'application/json',
      // To Be Done Later: Inject Okta session cookie or token header if needed
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final issues = body['issues'] as List<dynamic>;
      return issues.map((json) => JiraTicket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Jira tickets: ${response.statusCode}');
    }
  }
}

class JiraTicket {
  final String key;
  final String summary;
  final String status;

  JiraTicket({required this.key, required this.summary, required this.status});

  factory JiraTicket.fromJson(Map<String, dynamic> json) {
    return JiraTicket(
      key: json['key'],
      summary: json['fields']['summary'],
      status: json['fields']['status']['name'],
    );
  }
}
