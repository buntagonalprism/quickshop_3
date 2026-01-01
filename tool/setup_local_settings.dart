import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final interfaces = await NetworkInterface.list(
    includeLoopback: false,
    type: InternetAddressType.IPv4,
  );

  String? ip;

  for (final interface in interfaces) {
    for (final addr in interface.addresses) {
      // Heuristic: pick the first private LAN IPv4
      if (addr.address.startsWith('192.168.') || addr.address.startsWith('10.') || addr.address.startsWith('172.')) {
        ip = addr.address;
        break;
      }
    }
    if (ip != null) break;
  }

  // Fallback: first address if we didn't match private ranges
  ip ??= interfaces.isNotEmpty && interfaces.first.addresses.isNotEmpty
      ? interfaces.first.addresses.first.address
      : '127.0.0.1';

  final file = File('settings/app_settings_local.json');
  await file.writeAsString(
    const JsonEncoder.withIndent('  ').convert({
      'LOCAL_BACKEND_ENABLED': 'true',
      'LOCAL_BACKEND_IP': ip,
    }),
  );

  stdout.writeln('Host IP written to ip.json: $ip');
}
