// lib/data/mock_environment_data.dart
// Contains mock environment data used by EnvStatusScreen

import '../models/environment_group.dart';
import '../models/environment_tier.dart';
import '../models/server_status.dart';

final List<EnvironmentGroup> mockEnvironments = [
  EnvironmentGroup(
    name: 'Syteline 9.00.30 CTS',
    system: 'Syteline',
    tiers: [
      EnvironmentTier(
        tierName: 'Dev',
        servers: [
          ServerStatus(
            name: 'SQL-DEV-01',
            role: ServerRole.sql,
            ip: '10.1.1.1',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
          ServerStatus(
            name: 'APP-DEV-01',
            role: ServerRole.app,
            ip: '10.1.1.2',
            status: 'Warning',
            lastChecked: DateTime.now(),
          ),
        ],
      ),
      EnvironmentTier(
        tierName: 'QA',
        servers: [
          ServerStatus(
            name: 'SQL-QA-01',
            role: ServerRole.sql,
            ip: '10.2.1.1',
            status: 'Offline',
            lastChecked: DateTime.now(),
          ),
        ],
      ),
    ],
  ),
  EnvironmentGroup(
    name: 'Syteline 8.01.11 Rolligon',
    system: 'Syteline',
    tiers: [
      EnvironmentTier(
        tierName: 'Live',
        servers: [
          ServerStatus(
            name: 'SRVHOUSYL03',
            role: ServerRole.utility,
            ip: '10.3.1.3',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
          ServerStatus(
            name: 'SRVHOUSYL04',
            role: ServerRole.utility,
            ip: '10.3.1.4',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
          ServerStatus(
            name: 'SRVHOUSYLSQL01',
            role: ServerRole.sql,
            ip: '10.3.1.1',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
          ServerStatus(
            name: 'SRVHOUSYLSQL02',
            role: ServerRole.sql,
            ip: '10.3.1.2',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
        ],
      ),
      EnvironmentTier(
        tierName: 'Dev',
        servers: [
          ServerStatus(
            name: 'SRVHOUSYLSQLT1',
            role: ServerRole.sql,
            ip: '10.3.2.1',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
          ServerStatus(
            name: 'SRVHOUSYLT2',
            role: ServerRole.utility,
            ip: '10.3.2.2',
            status: 'Online',
            lastChecked: DateTime.now(),
          ),
        ],
      ),
    ],
  ),
];