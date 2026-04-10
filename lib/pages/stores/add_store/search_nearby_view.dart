import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../data/common/models/coordinates.dart';
import '../../../data/google_maps_platform/google_place_result.dart';
import '../../../data/google_maps_platform/google_places_provider.dart';
import '../../../data/stores/models/store.dart';
import '../../../services/auth_service.dart';
import '../../../services/location_service.dart';

class SearchNearbyView extends ConsumerStatefulWidget {
  const SearchNearbyView({super.key, required this.onDone});

  final void Function(Store store) onDone;

  @override
  ConsumerState<SearchNearbyView> createState() => _SearchNearbyViewState();
}

class _SearchNearbyViewState extends ConsumerState<SearchNearbyView> {
  final _controller = TextEditingController();
  Timer? _debounceTimer;

  String _query = '';
  GooglePlaceResult? _selectedResult;
  bool _isLoadingPlace = false;
  Coordinates? _currentLocation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initLocation());
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _initLocation() async {
    if (!mounted) return;
    if (!ref.read(canGetOrAutoRequestLocationProvider)) return;
    final location = await ref.read(locationServiceProvider).getLocationWithPermissionRequest(context);
    if (mounted && location != null) {
      setState(() => _currentLocation = location);
    }
  }

  Future<void> _onRequestLocation() async {
    if (!mounted) return;
    final location = await ref.read(locationServiceProvider).getLocationWithPermissionRequest(context);
    if (mounted && location != null) {
      setState(() => _currentLocation = location);
    }
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    setState(() {
      _query = value;
      _selectedResult = null;
    });
    _debounceTimer = Timer(
      const Duration(milliseconds: 400),
      () => setState(() => _query = value),
    );
  }

  Future<void> _onDone() async {
    if (_selectedResult == null) return;
    setState(() => _isLoadingPlace = true);

    try {
      final coordinates = await ref.read(
        googlePlaceCoordinatesProvider(_selectedResult!.placeId).future,
      );
      if (!mounted) return;

      final userId = ref.read(userIdProvider)!;
      final userAuth = ref.read(userAuthProvider)!;

      widget.onDone(
        Store(
          id: const Uuid().v4(),
          storeName: _selectedResult!.name,
          ownerId: userId,
          editorIds: [userId],
          editors: [userAuth],
          coordinates: coordinates,
          locations: const [],
        ),
      );
    } catch (_) {
      if (mounted) {
        setState(() => _isLoadingPlace = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to get store details. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final canGetLocation = ref.watch(canGetOrAutoRequestLocationProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Search for a store',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: _onSearchChanged,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        if (!canGetLocation)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: _onRequestLocation,
                child: Text(
                  'Location permissions are disabled',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        Expanded(child: _buildResultsList()),
        if (_selectedResult != null)
          Material(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
                left: 16,
                right: 8,
                top: 4,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedResult!.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _isLoadingPlace
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : TextButton.icon(
                          onPressed: _onDone,
                          icon: const Icon(Icons.check),
                          label: const Text('Done'),
                        ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildResultsList() {
    if (_query.trim().isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Start typing to search for nearby stores',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final resultsAsync = ref.watch(
      googlePlacesAutocompleteProvider(
        _query,
        location: _currentLocation,
      ),
    );

    return resultsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Failed to load results. Check your connection.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (results) {
        if (results.isEmpty) {
          return const Center(child: Text('No stores found'));
        }
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];
            final isSelected = _selectedResult?.placeId == result.placeId;
            return ListTile(
              title: Text(result.name),
              subtitle: result.address.isNotEmpty
                  ? Text(
                      result.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              leading: const Icon(Icons.store_outlined),
              trailing: isSelected ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary) : null,
              selected: isSelected,
              onTap: () => setState(() => _selectedResult = result),
            );
          },
        );
      },
    );
  }
}
