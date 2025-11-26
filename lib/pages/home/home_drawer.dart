import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/analytics.dart';
import '../../router.dart';
import '../../services/auth_service.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userAuthProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 64,
                  color: Colors.white,
                ),
                Text(
                  user?.name ?? user?.email ?? 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                if (user?.name != null && user?.email != null)
                  Text(
                    user!.email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              ref.read(routerProvider).push(Routes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              ref.read(authServiceProvider).logout();
              ref.read(analyticsProvider).logEvent(const AnalyticsEvent.logout());
            },
          ),
        ],
      ),
    );
  }
}
