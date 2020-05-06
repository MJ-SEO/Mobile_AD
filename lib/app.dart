import 'package:Shrine/detail.dart';
import 'package:Shrine/edit.dart';
import 'package:Shrine/profile.dart';
import 'package:flutter/material.dart';

import 'detail.dart';
import 'home.dart';
import 'login.dart';


class ShrineApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
          home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginPage(),
        '/Detail': (context) => DetailPages(),
        '/Edit' : (context) => EditPage(),
        '/Profile' : (context) => ProfilePage(),
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
