import 'dart:ffi';

import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage("assets/img/splash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/singup");
                  },
                  child: _text("Skip", Colors.white, 20.0),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 150),
              child: _text("""  Manage Your 
      Accounts""", Colors.white, 30.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, top: 600),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(100))),
                fixedSize: Size(200, 70),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/splash2");
              },
              child: Text("Next"),
            ),
          )
        ],
      ),
    );
  }

  Text _text(text, color, fontsize) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontsize),
    );
  }
}
