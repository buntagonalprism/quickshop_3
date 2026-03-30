// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logger)
const loggerProvider = LoggerFamily._();

final class LoggerProvider extends $FunctionalProvider<Logger, Logger, Logger>
    with $Provider<Logger> {
  const LoggerProvider._({
    required LoggerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loggerProvider',
         isAutoDispose: true,
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

String _$loggerHash() => r'a6c7d6f22ceba2259989a272958f676dc7813475';

final class LoggerFamily extends $Family
    with $FunctionalFamilyOverride<Logger, String> {
  const LoggerFamily._()
    : super(
        retry: null,
        name: r'loggerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoggerProvider call(String source) =>
      LoggerProvider._(argument: source, from: this);

  @override
  String toString() => r'loggerProvider';
}
