import 'dart:ui';
import 'package:awesome_card/awesome_card.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:examin/user_data/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SecondSceen extends StatefulWidget {
  final int index;
  const SecondSceen({Key? key, required this.index}) : super(key: key);

  @override
  _SecondSceenState createState() => _SecondSceenState();
}

class _SecondSceenState extends State<SecondSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, bottom: 34),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff31BBC5),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              height: 124,
              child: _text(
                "Receipt",
                Colors.black,
                25.0,
                FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            _text(
              "Payment Successful",
              Colors.black,
              25.0,
              FontWeight.bold,
            ),
            CreditCard(
                      cardNumber: cardlist[widget.index]['cardNumber'].toString(),
                      cardExpiry: cardlist[widget.index]["date"].toString(),
                      cardHolderName: cardlist[widget.index]["cardHolder"].toString(),
                      cvv: cardlist[widget.index]["cvvCode"].toString(),
                      bankName: cardlist[widget.index]["bank"],
                      showBackSide: false,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      textExpDate: 'Exp. Date',
                      textName: 'Anvar',
                      textExpiry: 'MM/YY',
                    ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  Container(
                    height: 184,
                    child: _first(),
                  ),
                  _liner(),
                  Container(
                    height: 210,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topLeft,
                          child: _text(
                            "    ITEMS BOUGHT",
                            Colors.black,
                            14.0,
                            FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        _second("    Chocolate cake mix", "x1", "\$25.0    "),
                        SizedBox(
                          height: 10,
                        ),
                        _second(
                            "    Granulated sugar", "     x2", "\$15.99    "),
                        SizedBox(
                          height: 10,
                        ),
                        _second("    Diet cola", "                    x8",
                            "\$10.75    "),
                        SizedBox(
                          height: 10,
                        ),
                        _second("    Pickle jar", "                  x2",
                            "]\$8.15    "),
                        SizedBox(
                          height: 10,
                        ),
                        _second(
                            "    Thyme leaves", "          x1", "\$5.00    "),
                      ],
                    ),
                  ),
                  _liner(),
                  Container(
                    height: 166,
                    color: Colors.green,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _second(text1, text2, text3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text(
          text1,
          Color(0xffA5A5A5),
          14.0,
          FontWeight.normal,
        ),
        _text(
          text2,
          Color(0xffA5A5A5),
          14.0,
          FontWeight.normal,
        ),
        _text(
          text3,
          Colors.black,
          14.0,
          FontWeight.normal,
        ),
      ],
    );
  }

  Container _liner() {
    return Container(
      decoration: DottedDecoration(
          shape: Shape.line,
          linePosition: LinePosition.bottom,
          color: Colors.black,
          strokeWidth: 5),
    );
  }

  Column _first() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: _text(
            "    #1413",
            Colors.black,
            14.0,
            FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 67,
          width: 87,
          child: Image(
            image: AssetImage("assets/img/icon.png"),
          ),
        ),
        SizedBox(
          height: 26,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _text(
              "     Store",
              Color(0xffA5A5A5),
              14.0,
              FontWeight.normal,
            ),
            _text(
              "Shoprite      ",
              Colors.black,
              14.0,
              FontWeight.normal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _text(
              "     Seller’s Name",
              Color(0xffA5A5A5),
              14.0,
              FontWeight.normal,
            ),
            _text(
              "John Stewart      ",
              Colors.black,
              14.0,
              FontWeight.normal,
            ),
          ],
        ),
      ],
    );
  }

  Text _text(text, Color color, double size, FontWeight weight) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      );
}
