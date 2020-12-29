import 'package:fitness_app/src/pages/home_page.dart';
import 'package:fitness_app/src/provider/bottombar_provider.dart';
import 'package:fitness_app/src/provider/log_provider.dart';
import 'package:fitness_app/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarNavigation()),
        ChangeNotifierProvider(create: (_) => LogProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: darkTheme,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
