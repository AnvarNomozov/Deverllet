import 'package:awesome_card/awesome_card.dart';
import 'package:examin/core/colors.dart';
import 'package:examin/user_data/card_data.dart';
import 'package:examin/user_data/quick_actions.dart';
import 'package:examin/user_data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:page_view_sliding_indicator/page_view_sliding_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController();
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
                  const Icon(Icons.menu),
                  Container(
                    child: Row(
                      children: [
                        _text("Hello, Tom ", ConstColor.black, 18.0,
                            FontWeight.normal),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://img.freepik.com/vrije-photo/taille-portret-van-knappe-ernstige-ongeschoren-man-houdt-de-handen-bij-elkaar-gekleed-in-een-donkerblauw-shirt-heeft-een-gesprek-met-de-gesprekspartner-staat-tegen-een-witte-muur-zelfverzekerde-man-freelancer_273609-16320.jpg?size=626&ext=jpg",
                          ),
                        ),
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
                const Color(0xFFB7B7B7),
                12.0,
                FontWeight.normal,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: _text(
                  "     Quick Actions",
                  Color(0xff073B80),
                  25.0,
                  FontWeight.bold,
                ),
              ),
              Container(
                height: 139,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 115,
                      width: 139,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 17, bottom: 18.0),
                            height: 40,
                            width: 50,
                            child: Image(
                              image: quiclist[index]["img"],
                            ),
                          ),
                          _text(
                            quiclist[index]["text"],
                            Colors.black,
                            18.0,
                            FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 374,
                child: Image(
                  image: AssetImage("assets/img/Group.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 314,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _text(
                            "Your Balace",
                            Colors.black,
                            18.0,
                            FontWeight.normal,
                          ),
                          Image(
                            image: AssetImage("assets/img/Vector.png"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 130),
                      child: _text(
                        "\$8500.00",
                        Color(0xff2D99FF),
                        30.0,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 164,
                      width: 250,
                      child: Image(
                        image: AssetImage("assets/img/columns.png"),
                      ),
                    ),
                  ],
                ),
              ),
              _sizebox(42.0),
              _row("assets/img/qr.png", "Paid by", "Ralph Edwards",
                  "54x xxxxx xxx 24", "1/15/12"),
              _sizebox(39.0),
              _row("assets/img/wallet.png", "Paid to", "Theresa Webb",
                  "12356 0800963", ""),
              _sizebox(42.0),
              Container(
                height: 771,
                width: 360,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    _sizebox(8.0),
                    const Image(
                      image: AssetImage("assets/img/ling.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 200, top: 12),
                      child: _text(
                        "Transactions",
                        Colors.black,
                        20.0,
                        FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: act.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) => Card(
                              child: ListTile(
                                title: Text(act[index]["title"]),
                                subtitle: Text(act[index]["subtitle"]),
                                trailing: _text(act[index]["trealing"],
                                    Colors.black, 16.0, FontWeight.bold),
                                leading: Container(
                                  height: 70,
                                  width: 70,
                                  color: Color(0xffC4C4C4),
                                  child: Image(
                                    image: act[index]["icon"],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),_sizebox(20.0),
                    Image.asset("assets/img/opacha.png")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _row(String image, text1, text2, text3, text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 70,
          width: 70,
          color: Color(0xffC4C4C4),
          child: Image.asset(image),
        ),
        Column(
          children: [
            _text(text1, Colors.black, 16.0, FontWeight.bold),
            _sizebox(6.0),
            _text(
              text2,
              Colors.black,
              16.0,
              FontWeight.normal,
            ),
            _text(text3, Colors.black, 16.0, FontWeight.normal),
            _text(text4, Colors.black, 16.0, FontWeight.normal)
          ],
        )
      ],
    );
    /*Row _row() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Color(0xffC4C4C4),
                  child: Image.asset("assets/img/qr.png"),
                ),
                Column(
                  children: [
                    _text("Paid by", Colors.black, 16.0, FontWeight.bold),
                    _sizebox(6.0),
                    _text("Ralph Edwards", Colors.black, 16.0,
                        FontWeight.normal),
                    _text("54x xxxxx xxx 24", Colors.black, 16.0,
                        FontWeight.normal),
                    _text("1/15/12", Colors.black, 16.0, FontWeight.normal)
                  ],
                )
              ],
            ); */
  }

  SizedBox _sizebox(hieght) => SizedBox(
        height: hieght,
      );

  Text _text(text, color, size, fontwight) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontwight,
        ),
      );
}
