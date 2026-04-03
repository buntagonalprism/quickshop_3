import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../data/common/models/coordinates.dart';
import '../../../data/stores/models/store.dart';
import '../../../services/auth_service.dart';
import '../../../services/location_service.dart';
import '../../../widgets/location_dialogs.dart';

class AddManuallyView extends ConsumerStatefulWidget {
  const AddManuallyView({super.key, required this.onDone});

  final void Function(Store store) onDone;

  @override
  ConsumerState<AddManuallyView> createState() => _AddManuallyViewState();
}

class _AddManuallyViewState extends ConsumerState<AddManuallyView> {
  final _nameController = TextEditingController();
  GoogleMapController? _mapController;
  Coordinates? _selectedCoordinates;

  @override
  void dispose() {
    _nameController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _moveToCurrentLocation({bool animate = true}) async {
    final location = await ref.read(locationServiceProvider).getCurrentLocation();
    if (!mounted || location == null) return;

    final cameraPosition = CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 16,
    );

    if (_mapController != null) {
      if (animate) {
        await _mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      } else {
        await _mapController!.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }
    }

    if (mounted) {
      setState(() => _selectedCoordinates = location);
    }
  }

  Future<void> _onLocationButtonTapped() async {
    final locationService = ref.read(locationServiceProvider);
    final permission = await locationService.checkPermission();

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      await _moveToCurrentLocation();
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) await LocationPermissionDeniedDialog.show(context);
      return;
    }

    if (!mounted) return;
    final shouldRequest = await LocationRationaleDialog.show(context);
    if (!shouldRequest || !mounted) return;

    final result = await locationService.requestPermission();
    if (result == LocationPermission.whileInUse || result == LocationPermission.always) {
      await _moveToCurrentLocation();
    } else if (result == LocationPermission.deniedForever && mounted) {
      await LocationPermissionDeniedDialog.show(context);
    }
  }

  void _onDone() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final userId = ref.read(userIdProvider)!;
    final userAuth = ref.read(userAuthProvider)!;

    widget.onDone(
      Store(
        id: const Uuid().v4(),
        storeName: name,
        ownerId: userId,
        editorIds: [userId],
        editors: [userAuth],
        coordinates: _selectedCoordinates,
        locations: const [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameIsEmpty = _nameController.text.trim().isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: TextField(
            controller: _nameController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Store name'),
            textCapitalization: TextCapitalization.words,
            onChanged: (_) => setState(() {}),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              if (!nameIsEmpty) _onDone();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Store Location (optional)',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 1.5,
                ),
                onMapCreated: (controller) async {
                  _mapController = controller;
                  final permission = await ref.read(locationServiceProvider).checkPermission();
                  if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
                    await _moveToCurrentLocation(animate: false);
                  }
                },
                onCameraMove: (position) {
                  _selectedCoordinates = Coordinates(
                    latitude: position.target.latitude,
                    longitude: position.target.longitude,
                  );
                },
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              ),
              const Center(
                child: IgnorePointer(
                  child: Icon(Icons.location_pin, size: 48, color: Colors.red),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: FloatingActionButton.small(
                  onPressed: _onLocationButtonTapped,
                  heroTag: 'store_add_location_button',
                  tooltip: 'My location',
                  child: const Icon(Icons.my_location),
                ),
              ),
            ],
          ),
        ),
        Material(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              right: 8,
              top: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: nameIsEmpty ? null : _onDone,
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
}
