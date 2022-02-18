import 'package:examin/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
MyRoute _route = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _route.onGenerateRoute,
    initialRoute: "/MainScreen",
    );
  }
}