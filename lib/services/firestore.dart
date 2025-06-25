import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore.g.dart';

const _useEmulator = String.fromEnvironment('FIRESTORE_EMULATOR_ENABLED');

@riverpod
FirebaseFirestore firestore(Ref ref) {
  final fs = FirebaseFirestore.instance;
  if (_useEmulator == 'true') {
    const emulatorHost = String.fromEnvironment(
      'FIRESTORE_EMULATOR_HOST',
      defaultValue: 'localhost:8080',
    );
    final parts = emulatorHost.split(':');
    final host = parts[0];
    final port = int.parse(parts[1]);
    fs.useFirestoreEmulator(host, port, automaticHostMapping: false);
  }
  return fs;
}
