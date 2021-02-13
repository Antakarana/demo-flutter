import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_my_assets/assets/images/Path.dart';
import 'package:save_my_assets/views/utils/functions/AppBar.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), icon_pink_marker);
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('id1'),
            position: LatLng(40.9975, 28.8506),
            icon: mapMarker,
            infoWindow: InfoWindow(
                title: "Bahcelievler Ilcesi", snippet: "Bahcelievler ...")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Google Harita"),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(40.9975, 28.8506),
          zoom: 15,
        ),
      ),
    );
  }
}
