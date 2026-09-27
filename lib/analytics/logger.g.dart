// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logger)
final loggerProvider = LoggerFamily._();

final class LoggerProvider extends $FunctionalProvider<Logger, Logger, Logger>
    with $Provider<Logger> {
  LoggerProvider._({
    required LoggerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loggerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loggerHash();

  @override
  String toString() {
    return r'loggerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Logger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Logger create(Ref ref) {
    final argument = this.argument as String;
    return logger(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Logger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Logger>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoggerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loggerHash() => r'2c718a938abc96656438569cb99933d55b5b026e';

final class LoggerFamily extends $Family
    with $FunctionalFamilyOverride<Logger, String> {
  LoggerFamily._()
    : super(
        retry: null,
        name: r'loggerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoggerProvider call(String source) =>
      LoggerProvider._(argument: source, from: this);

  @override
  String toString() => r'loggerProvider';
}
