import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_service.g.dart';

@Riverpod(keepAlive: true)
class LocaleService extends _$LocaleService {
  @override
  Locale build() {
    return const Locale('en');
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}
