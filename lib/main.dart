import 'package:flutter/material.dart';
import 'package:save_my_assets/views/ui/device_id/DeviceId.dart';
import 'package:save_my_assets/views/ui/map/MapSelection.dart';
import 'package:save_my_assets/views/ui/qr_code/QRCode.dart';
import 'package:save_my_assets/views/utils/widgets/TextButton.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  runApp(
    EasyLocalization(
      path: "lib/views/utils/translations",
      saveLocale: true,
      supportedLocales: [
        Locale('tr', 'TR'),
        Locale('en', 'EN'),
      ],
      child: MyApp(),
    ),
  );
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
            BtnWithText(
              text: 'get_device_id'.tr(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeviceId()),
                );
              },
              floorColor: Colors.white70,
            ),
            BtnWithText(
              text: 'map'.tr(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSelection()),
                );
              },
              floorColor: Colors.white70,
            ),
            BtnWithText(
              text: 'qr_code'.tr(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCode()),
                );
              },
              floorColor: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
