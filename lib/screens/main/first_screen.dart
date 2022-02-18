import 'package:awesome_card/awesome_card.dart';
import 'package:examin/core/colors.dart';
import 'package:examin/user_data/card_data.dart';
import 'package:flutter/material.dart';
import 'package:page_view_sliding_indicator/page_view_sliding_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _controller = PageController();
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
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: cardlist.length,
                  controller: _controller,
                  itemBuilder: (context, index) => InkWell(
                    child: CreditCard(
                      cardType: cardlist[index]["cardType"],
                      cardNumber: cardlist[index]['cardNumber'].toString(),
                      cardExpiry: cardlist[index]["date"].toString(),
                      cardHolderName: cardlist[index]["cardHolder"].toString(),
                      cvv: cardlist[index]["cvvCode"].toString(),
                      bankName: cardlist[index]["bank"],
                      showBackSide: false,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      textExpDate: 'Exp. Date',
                      textName: 'Anvar',
                      textExpiry: 'MM/YY',
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/seconscreen",
                          arguments: index);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
                child: PageViewSlidingIndicator(
                  color: Colors.green,
                  controller: _controller,
                  pageCount: 5,
                  size: 10,
                  borderRadius: 8,
                ),
              ),
              _text(
                "Hold your phone near the terminal",
                Color(0xFFB7B7B7),
                12.0,
                FontWeight.normal,
              ),
              // _text(text, color, size, fontwight)
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
