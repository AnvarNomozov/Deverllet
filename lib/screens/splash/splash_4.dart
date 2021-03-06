import 'package:flutter/material.dart';

class Splash4 extends StatelessWidget {
  const Splash4({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 150),
              child: _text("""Save Money""", Colors.white, 30.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, top: 550),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(100),
                  ),
                ),
                fixedSize: Size(200, 70),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/singup", (route) => false);
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, top: 650),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                    ),
                  ),
                  fixedSize: Size(200, 70),
                  primary: Colors.white),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (route) => false);
              },
              child: Text(
                "LogIn",
                style: TextStyle(fontSize: 25, color: Color(0xff31BBC5)),
              ),
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
