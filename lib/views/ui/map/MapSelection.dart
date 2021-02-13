import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:save_my_assets/views/ui/map/GoogleMap.dart';
import 'package:save_my_assets/views/utils/functions/AppBar.dart';
import 'package:save_my_assets/views/utils/widgets/TextButton.dart';
import 'package:easy_localization/easy_localization.dart';

class MapSelection extends StatefulWidget {
  @override
  _MapSelectionState createState() => _MapSelectionState();
}

class _MapSelectionState extends State<MapSelection> {
  String _locationMessage = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  openMapsSheet(context) async {
    try {
      final coords = Coords(
        40.766666,
        29.916668,
      );
      final title = 'city_kocaeli'.tr();
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(
                          map.mapName,
                          style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        leading: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position);
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('title_map'.tr()),
      body: Center(
        child: Column(
          children: [
            BtnWithText(
              text: 'click_for_bahcelievler_map'.tr(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoogleMapScreen(),
                  ),
                );
              },
            ),
            Builder(builder: (context) {
              return BtnWithText(
                text: 'click_to_direction_for_kocaeli'.tr(),
                function: () {
                  openMapsSheet(context);
                },
              );
            }),
            BtnWithText(
              text: 'click_to_open_location'.tr(),
              function: () {
                _getCurrentLocation();
              },
            ),
            Text(_locationMessage),
          ],
        ),
      ),
    );
  }
}
