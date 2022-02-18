import 'package:examin/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Container(
                    child: Row(
                      children: [
                        _text("Hello, Tom ", ConstColor.black, 18.0,
                            FontWeight.normal),
                        CircleAvatar(),
                      ],
                    ),
                  )
                ],
              ),
          CreditCardWidget(
        cardNumber: "12345678910112345",
        expiryDate: "10/20", 
        cardHolderName: "cardHolderName",
        cvvCode: "233",
        showBackView: false, onCreditCardWidgetChange: (CreditCardBrand ) {  }, //true when you want to show cvv(back) view
    ),
            ],
          ),
        ),
      ),
    );
  }

  Text _text(text, color, size, fontwight) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontwight,
        ),
      );
}
