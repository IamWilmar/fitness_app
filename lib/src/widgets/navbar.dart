import 'dart:convert';

import 'package:fitness_app/src/provider/bottombar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navBar = Provider.of<BottomBarNavigation>(context);
    return BottomNavigationBar(
      currentIndex: navBar.pagesIndex,
      onTap: (i) {
        navBar.pagesIndex = i;
      },
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFffffff),
        size: 37.0,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFffffff),
        size: 30.0,
      ),
      items: [
        BottomNavigationBarItem(
          activeIcon: NavBarIconShader(Icons.data_usage_outlined),
          icon: Icon(Icons.data_usage_outlined),
          label: "statistics",
        ),
        BottomNavigationBarItem(
          activeIcon: NavBarIconShader(Icons.run_circle_outlined),
          icon: Icon(Icons.run_circle_outlined),
          label: "log page",
        ),
        BottomNavigationBarItem(
          activeIcon: NavBarIconShader(Icons.settings_cell_outlined),
          icon: Icon(Icons.settings_cell_outlined),
          label: "settings",
        ),
      ],
    );
  }
}

//Importante Metodo Para conseguir gradiente en iconos
class NavBarIconShader extends StatelessWidget {
  final IconData navBarIcon;
  const NavBarIconShader(this.navBarIcon);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 0.5,
          colors: <Color>[
            Color(0xFF7075FF),
            Color(0xFF999CFF),
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Icon(navBarIcon),
    );
  }
}
