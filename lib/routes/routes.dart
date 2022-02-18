import 'package:examin/screens/auth/login.dart';
import 'package:examin/screens/auth/singup.dart';
import 'package:examin/screens/main/first_screen.dart';
import 'package:examin/screens/main/second_screen.dart';
import 'package:examin/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
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
