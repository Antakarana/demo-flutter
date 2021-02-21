import 'package:flutter/material.dart';
import 'package:save_my_assets/views/ui/Profile.dart';
import 'package:save_my_assets/views/ui/map/GoogleMap.dart';
import 'package:save_my_assets/views/ui/map/MapSelection.dart';
import 'package:save_my_assets/views/ui/qr_code/QRCode.dart';
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  Color activeColor = Color.fromRGBO(25, 178, 176, 1.0);
  Color inActiveColor = Color.fromRGBO(134, 135, 137, 1.0);

  final List<Widget> screens = [
    QRCode(),
    GoogleMapScreen(),
    MapSelection(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: activeColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 0 ? activeColor : inActiveColor,
                        ),
                        Text(
                          'profile'.tr(),
                          style: TextStyle(
                            color:
                                currentTab == 0 ? activeColor : inActiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = MapSelection();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_sharp,
                          color: currentTab == 1 ? activeColor : inActiveColor,
                        ),
                        Text(
                          'map_selection'.tr(),
                          style: TextStyle(
                            color:
                                currentTab == 1 ? activeColor : inActiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = GoogleMapScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: currentTab == 2 ? activeColor : inActiveColor,
                        ),
                        Text(
                          'location'.tr(),
                          style: TextStyle(
                            color:
                                currentTab == 2 ? activeColor : inActiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = QRCode();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code,
                          color: currentTab == 3 ? activeColor : inActiveColor,
                        ),
                        Text(
                          'qr_code'.tr(),
                          style: TextStyle(
                            color:
                                currentTab == 3 ? activeColor : inActiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
