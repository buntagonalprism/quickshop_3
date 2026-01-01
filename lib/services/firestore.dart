import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'settings_service.dart';

part 'firestore.g.dart';

@riverpod
FirebaseFirestore firestore(Ref ref) {
  final fs = FirebaseFirestore.instance;
  final settings = ref.read(settingsServiceProvider);
  if (settings.localBackendEnabled) {
    fs.useFirestoreEmulator(settings.localBackendHost, _defaultFirestoreEmulatorPort, automaticHostMapping: false);
  }
  return fs;
}

const _defaultFirestoreEmulatorPort = 8080;
