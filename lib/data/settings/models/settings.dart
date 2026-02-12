import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    required ThemeMode themeMode,
  }) = _Settings;
}
