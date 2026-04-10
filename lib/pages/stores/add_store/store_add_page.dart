import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/stores/models/store.dart';
import '../../../router.dart';
import 'add_manually_view.dart';
import 'search_nearby_view.dart';

enum _StoreAddView { initial, searchNearby, addManually }

class StoreAddPage extends ConsumerStatefulWidget {
  const StoreAddPage({super.key, required this.listId});

  final String listId;

  @override
  ConsumerState<StoreAddPage> createState() => _StoreAddPageState();
}

class _StoreAddPageState extends ConsumerState<StoreAddPage> {
  _StoreAddView _currentView = _StoreAddView.initial;

  String get _title => switch (_currentView) {
    _StoreAddView.initial => 'Add store',
    _StoreAddView.searchNearby => 'Search nearby places',
    _StoreAddView.addManually => 'Add store manually',
  };

  void _goBack() => setState(() => _currentView = _StoreAddView.initial);

  void _onStoreDone(Store store) {
    print('Store created: $store');
    ref.read(routerProvider).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentView == _StoreAddView.initial,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _goBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add store'),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: switch (_currentView) {
            _StoreAddView.initial => _InitialView(
              key: const ValueKey('initial'),
              onSearchNearby: () => setState(() => _currentView = _StoreAddView.searchNearby),
              onAddManually: () => setState(() => _currentView = _StoreAddView.addManually),
            ),
            _StoreAddView.searchNearby => SearchNearbyView(
              key: const ValueKey('searchNearby'),
              onDone: _onStoreDone,
            ),
            _StoreAddView.addManually => AddManuallyView(
              key: const ValueKey('addManually'),
              onDone: _onStoreDone,
            ),
          },
        ),
      ),
    );
  }
}

class _InitialView extends StatelessWidget {
  const _InitialView({
    super.key,
    required this.onSearchNearby,
    required this.onAddManually,
  });

  final VoidCallback onSearchNearby;
  final VoidCallback onAddManually;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          _OptionTile(
            title: 'Search nearby places',
            icon: Icons.location_on_outlined,
            onTap: onSearchNearby,
          ),
          const SizedBox(height: 12),
          _OptionTile(
            title: 'Add store manually',
            icon: Icons.edit_outlined,
            onTap: onAddManually,
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(title),
          trailing: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
      ),
    );
  }
}
