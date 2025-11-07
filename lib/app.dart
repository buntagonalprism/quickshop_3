import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'analytics/crash_reporter.dart';
import 'application/settings_notifier.dart';
import 'localization/app_localizations.dart';
import 'repositories/shopping/history/shopping_category_history_repo.dart';
import 'repositories/shopping/history/shopping_item_history_repo.dart';
import 'repositories/shopping/suggestions/shopping_category_suggestion_repo.dart';
import 'repositories/shopping/suggestions/shopping_item_suggestion_repo.dart';
import 'repositories/user_repo.dart';
import 'router.dart';
import 'services/app_database_provider.dart';
import 'services/locale_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return _EagerInitProviders(
        child: MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) {
            final locale = Localizations.localeOf(context);
            Future.delayed(
              Duration.zero,
              () => ref.read(localeServiceProvider.notifier).setLocale(locale),
            );

            return AppLocalizations.of(context)!.appTitle;
          },

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.dark,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),
          themeMode: ref.watch(settingsNotifierProvider).themeMode,

          routerConfig: ref.watch(routerProvider),
        ),
      );
    });
  }
}

class _EagerInitProviders extends ConsumerWidget {
  const _EagerInitProviders({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    ref.watch(crashReporterProvider);
    ref.watch(appDatabaseProvider);
    ref.watch(userRepoProvider);
    ref.watch(shoppingCategoryHistoryRepoProvider);
    ref.watch(shoppingItemHistoryRepoProvider);
    ref.watch(shoppingCategorySuggestionRepoProvider);
    ref.watch(shoppingItemSuggestionRepoProvider);
    return child;
  }
}
