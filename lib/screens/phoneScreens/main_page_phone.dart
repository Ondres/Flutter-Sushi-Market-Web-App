import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sushi/menu/added_item.dart';
import 'package:sushi/menu/menu_lists.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sushi/screens/phoneScreens/about_us_page_phone.dart';
import 'package:sushi/screens/phoneScreens/dilivery_info_page_phone.dart';
import 'package:sushi/screens/phoneScreens/order_page_phone.dart';
import 'package:sushi/screens/phoneScreens/sushi_page_phone.dart';
import 'package:sushi/screens/phone_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../menu/SushiClass.dart';
import 'package:hovering/hovering.dart';

Widget contentWidget = Container();
int totalPrice = 0;
int checkBottom = 1;
final Key contentWidgetKey = UniqueKey();
int firstIn = 0;
bool _isHovered = false;

bool img = true;
bool col = true;

class MainPagePhone extends StatefulWidget {
  const MainPagePhone({super.key});

  @override
  State<MainPagePhone> createState() => _MainPagePhoneState();
}

class _MainPagePhoneState extends State<MainPagePhone> {
  void ChangeContentWidget(Widget newWidget) {
    setState(() {
      contentWidget = newWidget;
    });
  }

  void BasketChangedAdd(Product product, bool same) {
    if (!same && !basket.contains(product)) {
      setState(() {
        basket.add(product);
        totalPrice += int.parse(product.price.replaceAll("₴", ""));
      });
    } else
      setState(() {
        totalPrice += int.parse(product.price.replaceAll("₴", ""));
      });
    if (contentWidget.key == contentWidgetKey) {
      ChangeContentWidget(OrderPagePhone(
          key: contentWidgetKey,
          price: totalPrice,
          changeBasket: BasketChangedDel,
          changeBasketAdd: BasketChangedAdd));
    }
  }

  void BasketChangedDel(Product product, bool same, {int? items}) {
    if (!same)
      setState(() {
        basket.remove(product);
        if (items != null)
          totalPrice -= items * int.parse(product.price.replaceAll("₴", ""));
      });
    else
      setState(() {
        totalPrice -= int.parse(product.price.replaceAll("₴", ""));
      });

    if (totalPrice < 0)
      setState(() {
        totalPrice = 0;
      });

    if (contentWidget.key == contentWidgetKey)
      ChangeContentWidget(OrderPagePhone(
          key: contentWidgetKey,
          price: totalPrice,
          changeBasket: BasketChangedDel,
          changeBasketAdd: BasketChangedAdd));
  }

  void First() {
    if (firstIn == 0)
      setState(() {
        firstIn++;
        contentWidget = Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
              child: Text("Фірмові роли",
                  style: TextStyle(
                      fontSize: 35,
                      color: Color.fromRGBO(255, 141, 64, 1),
                      fontWeight: FontWeight.bold)),
            ),
            SushiListPhone(
              changeBasket: BasketChangedAdd,
              sushiList: firmovi_roll,
              row: 0,
            ),
            SushiListPhone(
              changeBasket: BasketChangedAdd,
              sushiList: firmovi_roll,
              row: 1,
            ),
            SushiListPhone(
              changeBasket: BasketChangedAdd,
              sushiList: firmovi_roll,
              row: 2,
            ),
            SushiListPhone(
              changeBasket: BasketChangedAdd,
              sushiList: firmovi_roll,
              row: 3,
            ),
          ],
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    First();
    return Scaffold(
        body: Stack(children: [
      PhoneScreen(
          changeContentWidget: ChangeContentWidget,
          BasketChangedAdd: BasketChangedAdd,
          BasketChangedDel: BasketChangedDel),
      Positioned(
          top: 110,
          left: MediaQuery.of(context).size.width * 0.85,
          child: Opacity(
              opacity: contentWidget.key != contentWidgetKey
                  ? basket.isEmpty
                      ? 0
                      : 0.9
                  : 0,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                    onPressed: () {
                      !basket.isEmpty?
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              width: 220,
                              height: 230,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 220,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    child: ListView.builder(
                                      itemCount: basket.length,
                                      itemBuilder: (context, index) {
                                        Product product = basket[index];
                                        return AddedSushiItem(
                                          empty: true,
                                          product: product,
                                          changeBasket: BasketChangedDel,
                                          changeBasketAdd: BasketChangedAdd,
                                          counters: counters,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ):Container();
                    },
                  )))),
      Positioned(
        top: 130,
        left: MediaQuery.of(context).size.width * 0.85 + 25,
        child: Opacity(
            opacity: contentWidget.key != contentWidgetKey
                ? basket.isEmpty
                    ? 0
                    : 0.9
                : 0,
            child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 9, 9, 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: Text(
                  basket.length.toString(),
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    ]));
  }
}

class SalesWidget extends StatefulWidget {
  final Function(Product, bool) changeBasket;

  const SalesWidget({super.key, required this.changeBasket});

  @override
  State<SalesWidget> createState() => _SalesWidgetState();
}

class _SalesWidgetState extends State<SalesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(img ? 'assets/sale.png' : 'assets/sale.png'),
                fit: BoxFit.fitHeight,
              )),
          margin: EdgeInsets.fromLTRB(30, 40, 30, 10),
        ),
        Container(
          height: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      col = true;
                      img = true;
                    });
                  },
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.circle_sharp,
                    color: col ? Colors.deepOrange : Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      col = false;
                      img = false;
                    });
                  },
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.circle_sharp,
                    color: col ? Colors.white : Colors.deepOrange,
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 55, 30, 90),
          child: CarouselWidget(
            widgets: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/sushi2.png'),
                      fit: BoxFit.fitWidth,
                    )),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180,
                child: Text("Суші з лососем",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/sushi2.png'),
                      fit: BoxFit.fitWidth,
                    )),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180,
                child: Text("З вугрем",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/sushi2.png'),
                      fit: BoxFit.fitWidth,
                    )),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180,
                child: Text("Гострі роли",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/sushi2.png'),
                      fit: BoxFit.fitWidth,
                    )),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180,
                child: Text("Веганські роли",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
          child: Text("Hot deals",
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromRGBO(255, 141, 64, 1),
                  fontWeight: FontWeight.bold)),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 520,
            child: Column(
              children: [
                SushiListPhone(
                  sushiList: firmovi_roll,
                  changeBasket: widget.changeBasket,
                  row: 0,
                ),
                SushiListPhone(
                  sushiList: firmovi_roll,
                  changeBasket: widget.changeBasket,
                  row: 1,
                )
              ],
            )),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.fromLTRB(30, 80, 30, 90),
          width: MediaQuery.of(context).size.width,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Інші акції та новини",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(122, 187, 102, 1),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                child: CarouselWidget(
                  widgets: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/sushi3.png'),
                            fit: BoxFit.fitWidth,
                          )),
                      width: 280,
                      height: 280,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/sushi3.png'),
                            fit: BoxFit.fitWidth,
                          )),
                      width: 280,
                      height: 280,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/sushi3.png'),
                            fit: BoxFit.fitWidth,
                          )),
                      width: 280,
                      height: 280,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 40),
          child: Text("Ми - Sucheff",
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromRGBO(255, 141, 64, 1),
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 530,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: CarouselWidget(
                  widgets: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                child: CarouselWidget(
                  widgets: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/cheff.png'),
                                    fit: BoxFit.cover,
                                  )),
                              height: 140,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomInfo extends StatefulWidget {
  const BottomInfo({super.key});

  @override
  State<BottomInfo> createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 20, 60, 20),
            child: Text("Суші у Дніпрі",
                style: TextStyle(
                    fontSize: 35,
                    color: Color.fromRGBO(122, 187, 102, 1),
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 60, 20),
            child: Text(
              "Замовити суші у Дніпрі з безкоштовною доставкою",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 0, 60, 20),
              child: Text(
                "At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.",
              )),
        ],
      ),
    );
  }
}

class BottomContacts extends StatefulWidget {
  const BottomContacts({super.key});

  @override
  State<BottomContacts> createState() => _BottomContactsState();
}

class _BottomContactsState extends State<BottomContacts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          height: 260,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 180,
                            width: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " Панікахи, 17",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " Панікахи, 17",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " Панікахи, 17",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_phone_sharp,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " +38 (050) 20 500 55",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_phone_sharp,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " +38 (050) 20 500 55",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_phone_sharp,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      " +38 (050) 20 500 55",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/Facebook.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/Instagram.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Привабливі акції щомісяця\nПідписуйтесь на наші соціальні мережі!",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(242, 242, 242, 1),
          ),
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Text("© 2023 SuCheff Все права защищены"),
        ),
      ],
    );
  }
}

class AdressesWidget extends StatefulWidget {
  const AdressesWidget({super.key});

  @override
  State<AdressesWidget> createState() => _AdressesWidgetState();
}

class _AdressesWidgetState extends State<AdressesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      height: 290,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/sushi1.png'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              padding: EdgeInsets.only(right: 20),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(122, 187, 102, 1),
                    size: 20,
                  ),
                  Text(
                    "м. Дніпро, Панікахи, 17",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.only(right: 20),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(122, 187, 102, 1),
                    size: 20,
                  ),
                  Text(
                    "м. Дніпро, Панікахи, 17",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.only(right: 20),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(122, 187, 102, 1),
                    size: 20,
                  ),
                  Text(
                    "м. Дніпро, Панікахи, 17",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
          Container(
            width: 200,
            height: 10,
            decoration: BoxDecoration(
              color: Color.fromRGBO(242, 242, 242, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<Widget> widgets;

  CarouselWidget({required this.widgets});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widgets,
      options: CarouselOptions(
        height: 200,
        enableInfiniteScroll: true,
        initialPage: 0,
        viewportFraction: 1.0,
        autoPlayInterval: Duration(seconds: 4),
        reverse: false,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        onPageChanged: (index, _) {
          // Обработка события изменения страницы
        },
      ),
    );
  }
}
