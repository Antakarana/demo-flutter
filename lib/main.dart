import 'package:flutter/material.dart';
import 'package:save_my_assets/views/ui/device_id/DeviceId.dart';
import 'package:save_my_assets/views/ui/map/MapSelection.dart';
import 'package:save_my_assets/views/ui/qr_code/QRCode.dart';
import 'package:save_my_assets/views/utils/functions/TextButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[400],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            buildTextButton(
              text: "Cihaz Id'sini Al",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeviceId()),
                );
              },
            ),
            buildTextButton(
              text: "Harita",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSelection()),
                );
              },
            ),
            buildTextButton(
              text: "QR Kod",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCode()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
