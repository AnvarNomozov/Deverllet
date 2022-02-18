import 'package:examin/core/colors.dart';
import 'package:examin/core/fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/user_model.dart';
import '../../user_data/user_data.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
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
                  _text("Register", ConstSize.BigFont, ConstColor.white,
                      FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  _text(
                    "Register and start managine your finances",
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
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: _inputdecoration(
                          "Full Name",
                          "Name",
                          const Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please, Fill the line";
                          } else if (value.length < 6) {
                            return "5 tadan kam bo'lmasin";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: _inputdecoration(
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
                        decoration: _inputdecoration(
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
                        child: const Text("Register"),
                        onPressed: _onPressed,
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
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Text("Already have an account?, Login"),
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
    String name = _nameController.text;
    String password = _passwordController.text;
    int id = UserData.UserList.length;
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      bool isTrue = true;
      for (User user in UserData.UserList) {
        if (email == user.email) {
          // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> FirstPage()));
          // return true;
          isTrue = false;
        }
      }
      if (isTrue == true) {
        UserData.UserList.add(User(id + 1, name, email, password));
        Navigator.pushNamed(context, "/login");
      }
      if (isTrue == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            dismissDirection: DismissDirection.horizontal,
            backgroundColor: Colors.redAccent,
            content: Text("This email address already has signed in"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  InputDecoration _inputdecoration(hinttext, labeltext, suffixicon) =>
      InputDecoration(
        hintText: hinttext,
        labelText: labeltext,
        suffixIcon: suffixicon,
        filled: true,
        fillColor: ConstColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  Text _text(text, fontsize, color, fontwight) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize, color: color, fontWeight: fontwight),
    );
  }
}
