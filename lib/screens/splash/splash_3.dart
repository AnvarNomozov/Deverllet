import 'package:flutter/material.dart';

class Splash3 extends StatelessWidget {
  const Splash3({Key? key}) : super(key: key);

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
                  onPressed: () {Navigator.pop(context);},
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/splash4");
                  },
                  child: _text("Skip", Colors.white, 20.0),
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
            padding: const EdgeInsets.only(left: 200, top: 600),
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
                Navigator.pushNamed(context, "/splash4");
              },
              child: Text("Next",style: TextStyle(fontSize: 25),),
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
