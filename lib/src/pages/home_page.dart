import 'package:fitness_app/src/pages/log_manager_page.dart';
import 'package:fitness_app/src/pages/settings_page.dart';
import 'package:fitness_app/src/pages/statistics_page.dart';
import 'package:fitness_app/src/provider/bottombar_provider.dart';
import 'package:fitness_app/src/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "homePage";
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<BottomBarNavigation>(context);
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: navigation.pageController,
        children: [
          StatisticsPage(),
          LogManagerPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}


