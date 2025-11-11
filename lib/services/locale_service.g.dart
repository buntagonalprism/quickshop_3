// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocaleService)
const localeServiceProvider = LocaleServiceProvider._();

final class LocaleServiceProvider
    extends $NotifierProvider<LocaleService, Locale> {
  const LocaleServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'localeServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$localeServiceHash();

  @$internal
  @override
  LocaleService create() => LocaleService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeServiceHash() => r'042f681ed183ef7cc40097e8276f36540af86091';

abstract class _$LocaleService extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Locale, Locale>, Locale, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
