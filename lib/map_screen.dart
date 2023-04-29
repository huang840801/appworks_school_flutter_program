import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _initialLocation = const LatLng(25.048472, 121.532385);
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final CameraPosition _schoolPosition = const CameraPosition(target: LatLng(25.038472, 121.532385), zoom: 20);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/pin.png").then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  Future<void> _goToSchool() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_schoolPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 10,
            ),
            circles: {
              Circle(
                circleId: const CircleId('Circle'),
                center: const LatLng(25.048472, 121.532385),
                radius: 4000,
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                strokeColor: Colors.blue.shade100.withOpacity(0.5),
              )
            },
            markers: {
              Marker(
                markerId: const MarkerId('Marker1'),
                position: const LatLng(25.048472, 121.532385),
                draggable: true,
                infoWindow: const InfoWindow(
                  title: 'Marker1',
                  snippet: 'content1',
                ),
                onDragEnd: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("latitude=${value.latitude}, longitude=${value.longitude}"),
                  ));
                },
                icon: markerIcon,
              ),
              const Marker(
                markerId: MarkerId('Marker2'),
                position: LatLng(25.047472, 121.332385),
                infoWindow: InfoWindow(
                  title: 'Marker2',
                  snippet: 'content2',
                ),
              ),
              const Marker(
                markerId: MarkerId('Marker3'),
                position: LatLng(25.047972, 121.432385),
                infoWindow: InfoWindow(
                  title: 'Marker3',
                  snippet: 'content3',
                ),
              ),
              const Marker(
                markerId: MarkerId('Marker4'),
                position: LatLng(24.907472, 121.502385),
                infoWindow: InfoWindow(
                  title: 'Marker4',
                  snippet: 'content4',
                ),
              ),
              const Marker(
                markerId: MarkerId('Marker5'),
                position: LatLng(25.056472, 121.722385),
                infoWindow: InfoWindow(
                  title: 'Marker5',
                  snippet: 'content5',
                ),
              ),
              const Marker(
                markerId: MarkerId('Marker6'),
                position: LatLng(25.037472, 121.632385),
                infoWindow: InfoWindow(
                  title: 'Marker5',
                  snippet: 'content5',
                ),
              )
            },
          ),
          Positioned(
              left: 10,
              bottom: 40,
              child: FloatingActionButton.extended(
                onPressed: _goToSchool,
                label: const Text('Go To School!'),
                icon: const Icon(Icons.school),
              ))
        ],
      ),
    );
  }
}
