import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/pages/home_menu_page/challenge_page.dart';
import 'package:langapp/pages/home_menu_page/home_page.dart';
import 'package:langapp/pages/home_menu_page/profile_page.dart';
import 'package:langapp/pages/home_menu_page/settings_page.dart';
import 'package:langapp/styles/colors.dart';

// TODO: dopracować shadow i zmiane koloru po kliknięciu
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

  // TODO: jak zmienić kolor ?

  Widget _getMenuIcon({@required String iconPath, int buttonIndex, bool isChosen = false}) => SvgPicture.asset(
        iconPath,
        height: 23.0,
        color: (isChosen ? YELLOW : BROWN_DARK),
      );

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        elevation: 20.0,
        selectedFontSize: 12.0,
        selectedItemColor: YELLOW,
        unselectedItemColor: BROWN_DARK,
        type: BottomNavigationBarType.fixed,
        backgroundColor: WHITE,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: this._getMenuIcon(iconPath: this.paths['homePath']),
            activeIcon: this._getMenuIcon(iconPath: this.paths['homePath'], isChosen: true),
          ),
          BottomNavigationBarItem(
            title: Text("Challenge"),
            icon: this._getMenuIcon(iconPath: this.paths['challengePath']),
            activeIcon: this._getMenuIcon(iconPath: this.paths['challengePath'], isChosen: true),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: this._getMenuIcon(iconPath: this.paths['profilePath']),
            activeIcon: this._getMenuIcon(iconPath: this.paths['profilePath'], isChosen: true),
          ),
          BottomNavigationBarItem(
            title: Text("Settings"),
            icon: this._getMenuIcon(iconPath: this.paths['settingsPath']),
            activeIcon: this._getMenuIcon(iconPath: this.paths['settingsPath'], isChosen: true),
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
