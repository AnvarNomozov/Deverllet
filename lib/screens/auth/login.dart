import 'package:examin/core/colors.dart';
import 'package:examin/core/fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/user_model.dart';
import '../../user_data/user_data.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isShow = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 132, left: 50),
              child: Column(
                children: [
                  _text("Welcome back!", ConstSize.BigFont, ConstColor.white,
                      FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  _text(
                    "Sign in and continue managing you finances",
                    ConstSize.NormalFont,
                    ConstColor.white,
                    FontWeight.bold,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 258),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: __decoration(
                          "Email Adress",
                          "Email",
                          
                          const Icon(Icons.email_outlined),
                          
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please, Fill the line";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter Email!";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: _isShow,
                        decoration: __decoration(
                          "Password",
                          "Password",
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isShow = !_isShow;
                                },
                              );
                            },
                            icon: Icon(Icons.remove_red_eye),
                            splashRadius: 10.0,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please, Fill the line";
                          } else if (value.length < 7) {
                            return "7 tadan kam bo'lmasin";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: Size(278, 67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Text("LOG IN"),
                        onPressed: _onPressed,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text("Forgot Password?"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _circleContainer(
                            SvgPicture.asset("assets/icon/Path1.svg")
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          _circleContainer(
                            SvgPicture.asset("assets/icon/Path2.svg")
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          _circleContainer(
                            SvgPicture.asset("assets/icon/Path51.svg")
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singup");
                        },
                        child: Text("Don't have an account?, Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _text(text, size, color, fontWeight) => Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
      );

  InputDecoration __decoration(hinttext, labeltext, suffixicon) {
    return InputDecoration(
      hintText: hinttext,
      labelText: labeltext,
      filled: true,
        fillColor: ConstColor.white,
      suffixIcon: suffixicon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container _circleContainer(icon) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: icon,
    );
  }

  _onPressed() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      for (User user in UserData.UserList) {
        if (email == user.email && password == user.password) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/MainScreen", (route) => false);
          return true;
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.redAccent,
          content: Text("wrong input, please enter correctly or Sign up first"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    InputDecoration _inputdecoration(hinttext, labeltext, suffixicon) =>
        InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          suffixIcon: suffixicon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
  }

  // _text(String s, double bigFont, Color white, FontWeight bold) {}
}
/*_inputdecoration(
                          "Password",
                          "Password",
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isShow = !_isShow;
                                },
                              );
                            },
                            icon: Icon(Icons.remove_red_eye),
                            splashRadius: 10.0,
                          ),
                        ), */