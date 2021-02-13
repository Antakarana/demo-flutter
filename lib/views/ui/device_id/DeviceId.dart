import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:save_my_assets/views/utils/functions/AppBar.dart';

class DeviceId extends StatefulWidget {
  @override
  _DeviceIdState createState() => _DeviceIdState();
}

class _DeviceIdState extends State<DeviceId> {
  String deviceId = "";

  @override
  void initState() {
    super.initState();
    getDeviceId();
  }

  getDeviceId() async {
    String deviceID;
    try {
      deviceID = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceID = 'Failed to get deviceId.';
    }

    setState(() {
      deviceId = deviceID;
      print(deviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Cihaz Id"),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Center(
            child: Text(
              'Device ID: $deviceId',
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
