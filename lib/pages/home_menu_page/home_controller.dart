import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/pages/home_menu_page/challenge_page.dart';
import 'package:langapp/pages/home_menu_page/home_page.dart';
import 'package:langapp/pages/home_menu_page/profile_page.dart';
import 'package:langapp/pages/home_menu_page/settings_page.dart';
import 'package:langapp/styles/colors.dart';

// TODO: dopracować shadow i wielkość ikonek
class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final Map<String, String> paths = {
    'homePath': 'assets/menu/home.svg',
    'challengePath': 'assets/menu/challenge.svg',
    'profilePath': 'assets/menu/profile.svg',
    'settingsPath': 'assets/menu/settings.svg',
  };

  final List<Widget> pages = [
    HomePage(key: PageStorageKey("HomePage")),
    ChallengePage(key: PageStorageKey("ChallengePage")),
    ProfilePage(key: PageStorageKey("ProfilePage")),
    SettingsPage(key: PageStorageKey("SettingsPage")),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _getMenuIcon({@required String iconPath}) {
    Widget icon = SvgPicture.asset(
      iconPath,
      color: BROWN_DARK,
      height: 23.0,
    );
    return icon;
  }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        elevation: 20.0,
        selectedFontSize: 12.0,
        selectedItemColor: YELLOW,
        type: BottomNavigationBarType.fixed,
        backgroundColor: WHITE,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Home", style: TextStyle(color: BROWN_DARK)),
            icon: this._getMenuIcon(iconPath: this.paths['homePath']),
          ),
          BottomNavigationBarItem(
            title: Text("Challenge", style: TextStyle(color: BROWN_DARK)),
            icon: this._getMenuIcon(iconPath: this.paths['challengePath']),
          ),
          BottomNavigationBarItem(
            title: Text("Profile", style: TextStyle(color: BROWN_DARK)),
            icon: this._getMenuIcon(iconPath: this.paths['profilePath']),
          ),
          BottomNavigationBarItem(
            title: Text("Settings", style: TextStyle(color: BROWN_DARK)),
            icon: this._getMenuIcon(iconPath: this.paths['settingsPath']),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
