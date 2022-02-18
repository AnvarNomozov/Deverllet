import 'package:examin/screens/auth/login.dart';
import 'package:examin/screens/auth/singup.dart';
import 'package:examin/screens/main/first_screen.dart';
import 'package:examin/screens/main/second_screen.dart';
import 'package:examin/screens/splash/splash_2.dart';
import 'package:examin/screens/splash/splash_3.dart';
import 'package:examin/screens/splash/splash_4.dart';
import 'package:flutter/material.dart';

import '../screens/splash/splash_1.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Splash1());
        case "/splash2":
        return MaterialPageRoute(builder: (_) => Splash2());
        case "/splash3":
        return MaterialPageRoute(builder: (_) => Splash3());
        case "/splash4":
        return MaterialPageRoute(builder: (_) => Splash4());
      case "/login":
        return MaterialPageRoute(builder: (_) => LogIn());
        case "/singup":
        return MaterialPageRoute(builder: (_) => SingUp());
        case "/MainScreen":
        return MaterialPageRoute(builder: (_) => MainScreen());
        case "/seconscreen":
        return MaterialPageRoute(builder: (_) => SecondSceen(index: (args as int),));
    }

  }
}
