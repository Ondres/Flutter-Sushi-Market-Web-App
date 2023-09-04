import 'package:flutter/material.dart';
import 'package:sushi/menu/menu_lists.dart';
import 'package:sushi/screens/about_us_page.dart';
import 'package:sushi/screens/dilivery_info_page.dart';
import 'package:sushi/screens/order_page.dart';
import 'package:sushi/screens/phoneScreens/main_page_phone.dart';
import 'package:sushi/screens/phone_screen.dart';
import '../menu/SushiClass.dart';
import '../menu/added_item.dart';
import 'sushi_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Widget contentWidget = Container();
int totalPrice = 0;
int checkBottom = 1;
final Key contentWidgetKey = UniqueKey();
int firstIn = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void ChangeContentWidget(Widget newWidget) {
    setState(() {
      contentWidget = newWidget;
    });
  }

  void BasketChangedAdd(Product product, bool same) {
    if (!same&&!basket.contains(product)) {
      setState(() {
        basket.add(product);
        totalPrice += int.parse(product.price.replaceAll("₴", ""));
      });
    } else
      setState(() {
        totalPrice += int.parse(product.price.replaceAll("₴", ""));
      });
    if (contentWidget.key == contentWidgetKey) {
      ChangeContentWidget(OrderPage(
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
      ChangeContentWidget(OrderPage(
          key: contentWidgetKey,
          price: totalPrice,
          changeBasket: BasketChangedDel,
          changeBasketAdd: BasketChangedAdd));
  }

  void First() {
    if (firstIn == 0)
      setState(() {
        firstIn++;
        contentWidget = SalesWidget(
          changeBasket: BasketChangedAdd,
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    First();
    return Scaffold(
      body: MediaQuery.of(context).size.width > 1000
          ? Row(
              children: [
                Container(
                  color: Colors.white,
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width >= 1400
                      ? (MediaQuery.of(context).size.width - 1000) / 2
                      : MediaQuery.of(context).size.width * 0.05,
                  child: Column(
                    children: [
                      MediaQuery.of(context).size.width >= 1400
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  contentWidget = SalesWidget(
                                    changeBasket: BasketChangedAdd,
                                  );
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/big_logo.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                                alignment: Alignment.topCenter,
                              ))
                          : Container(),
                      MediaQuery.of(context).size.width >= 1400
                          ? Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 200,
                              height: 300,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  print(index);
                                  return TextButton(
                                    onPressed: () {
                                      if (index == 1)
                                        setState(() {
                                          contentWidget = Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    30, 50, 30, 50),
                                                child: Text("Фірмові роли",
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Color.fromRGBO(
                                                            255, 141, 64, 1),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SushiList(
                                                changeBasket: BasketChangedAdd,
                                                sushiList: firmovi.sublist(0,4),
                                              ),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: firmovi.sublist(4,7)),
                                            ],
                                          );
                                        });

                                      if (index == 0)
                                        setState(() {
                                          contentWidget = Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    30, 50, 30, 50),
                                                child: Text("Набори",
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Color.fromRGBO(
                                                            255, 141, 64, 1),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: philadelphia.sublist(0,4)),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: philadelphia.sublist(4,6)),
                                            ],
                                          );
                                        });

                                      if (index == 2)
                                        setState(() {
                                          contentWidget = Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    30, 50, 30, 50),
                                                child: Text("Великі роли",
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Color.fromRGBO(
                                                            255, 141, 64, 1),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: classic.sublist(0,4)),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: classic.sublist(4,8)),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: classic.sublist(8,12)),
                                              SushiList(
                                                  changeBasket:
                                                  BasketChangedAdd,
                                                  sushiList: classic.sublist(12,14)),
                                            ],
                                          );
                                        });

                                      if (index == 3)
                                        setState(() {
                                          contentWidget = Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    30, 50, 30, 50),
                                                child: Text("Роли в норі",
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Color.fromRGBO(
                                                            255, 141, 64, 1),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: maki.sublist(0,4)),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: maki.sublist(4,6)),
                                            ],
                                          );
                                        });

                                      if (index == 4)
                                        setState(() {
                                          contentWidget = Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    30, 50, 30, 50),
                                                child: Text("Суші та гункани",
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Color.fromRGBO(
                                                            255, 141, 64, 1),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: sushi.sublist(0,4)),
                                              SushiList(
                                                  changeBasket:
                                                      BasketChangedAdd,
                                                  sushiList: sushi.sublist(4,6)),
                                            ],
                                          );
                                        });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                      // color: Colors.black26,
                                      height: 40,
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                //  color: Colors.black12,
                                                image: DecorationImage(
                                              image: AssetImage(images[index]),
                                              fit: BoxFit.fitHeight,
                                            )),
                                            alignment: Alignment.topCenter,
                                          ),
                                          Container(
                                            child: Text(
                                              chapters[index],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromRGBO(242, 242, 242, 1),
                  width: MediaQuery.of(context).size.width >= 1400
                      ? 1000
                      : MediaQuery.of(context).size.width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TopBoardWidget(
                          BasketChangedAdd: BasketChangedAdd,
                          changeContentWidget: ChangeContentWidget,
                          BasketChangedDel: BasketChangedDel,
                        ),
                        contentWidget,
                        Visibility(
                          visible: contentWidget.key != contentWidgetKey,
                          child: BottomInfo(),
                        ),
                        BottomContacts(
                          changeBasketAdd: BasketChangedAdd,
                          changeContentWidget: ChangeContentWidget,
                        ),
                      ],
                    ),
                    //
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width >= 1400
                      ? (MediaQuery.of(context).size.width - 1000) / 2
                      : MediaQuery.of(context).size.width * 0.05,
                  child: MediaQuery.of(context).size.width >= 1400
                      ? Column(
                          children: [
                            basket.isEmpty
                                ? Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 100),
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(242, 242, 242, 1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 190,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/cartIcon.png'),
                                                  fit: BoxFit.fitWidth,
                                                )),
                                                width: 36,
                                                height: 33,
                                              ),
                                              Container(
                                                child: Text(
                                                  "Ваш кошик \n порожній",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Може вже з'їмо щось зараз?"),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            height: 60,
                                            width: 190,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Безкоштовна доставка\n',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 141, 64, 1),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' по Дніпру від 400 грн!',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                : contentWidget.key != contentWidgetKey
                                    ? Container(
                                        margin: EdgeInsets.only(top: 20),
                                        width: 220,
                                        height: 260,
                                        child: ListView.builder(
                                          itemCount: basket.length,
                                          itemBuilder: (context, index) {
                                            Product product = basket[index];
                                            return AddedSushiItem(
                                              product: product,
                                              changeBasket: BasketChangedDel,
                                              changeBasketAdd: BasketChangedAdd,
                                              counters: counters,
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                            basket.isEmpty
                                ? AdressesWidget()
                                : contentWidget.key != contentWidgetKey
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        width: 240,
                                        child: Column(
                                          children: [
                                            Container(
                                                width: 220,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "Сума до сплати:",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      width: 150,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        totalPrice.toString() +
                                                            '  ₴',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      width: 70,
                                                    ),
                                                  ],
                                                )),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  contentWidget = OrderPage(
                                                    price: totalPrice,
                                                    changeBasket:
                                                        BasketChangedDel,
                                                    changeBasketAdd:
                                                        BasketChangedAdd,
                                                    key: contentWidgetKey,
                                                  );
                                                });
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 220,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular((5))),
                                                  color: Color.fromRGBO(
                                                      122, 187, 102, 1),
                                                ),
                                                child: Text(
                                                  "Перейти до замовлення",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : AdressesWidget(),
                          ],
                        )
                      : Container(),
                ),
              ],
            )
          : MainPagePhone(),
    );
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
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/sale.png'),
                fit: BoxFit.contain,
              )),
          margin: EdgeInsets.fromLTRB(30, 50, 30, 25),
        ),
        Container(
          height: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle_sharp,
                color: Colors.deepOrange,
              ),
              Icon(
                Icons.circle_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 85, 30, 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                width: 220,
                height: 220,
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
                width: 220,
                height: 220,
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
                width: 220,
                height: 220,
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
                width: 220,
                height: 220,
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
          padding: EdgeInsets.only(left: 20),
          width: 1000,
          height: 380,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 350,
                width: 210,
                child: Column(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          showAlertDialog(context, pr, widget.changeBasket);
                        },
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: Colors.black26,
                              image: DecorationImage(
                                image: AssetImage(pr.image),
                                fit: BoxFit.fitWidth,
                              )),
                        )),
                    Container(
                      height: 35,
                      margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                      child: Text(
                        pr.name,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      height: 15,
                      margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                      child: Text("Вага: " + pr.weight),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            pr.price,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              minimumSize: Size(100, 45),
                            ),
                            onPressed: () {
                              if(counters.containsKey(pr)) {
                                setState(() {
                                  int k = counters[pr]!;
                                  k++;
                                  counters[pr] = k;
                                });
                              }
                              else
                                counters[pr] = 1;
                              widget.changeBasket(pr, false);
                            },
                            child: Text('Замовити'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.fromLTRB(30, 80, 30, 90),
          width: 1000,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Інші акції та новини",
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromRGBO(122, 187, 102, 1),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
          width: 1000,
          height: 530,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 250,
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
                              height: 110,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: 250,
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
                              height: 110,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: 250,
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
                              height: 110,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 250,
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
                              height: 110,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: 250,
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
                              height: 110,
                            ),
                            Text(
                                "Професіоналізм та відданість своїй справі нашого майстра"),
                          ],
                        )),
                    Container(
                        width: 250,
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
                              height: 110,
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

class TopBoardWidget extends StatefulWidget {
  final Function(Widget) changeContentWidget;
  final Function(Product product, bool same) BasketChangedAdd;
  final Function(Product product, bool same, {int? items}) BasketChangedDel;

  const TopBoardWidget(
      {Key? key,
      required this.changeContentWidget,
      required this.BasketChangedAdd,
      required this.BasketChangedDel})
      : super(key: key);

  @override
  State<TopBoardWidget> createState() => _TopBoardWidgetState();
}

class _TopBoardWidgetState extends State<TopBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 10),
                  child: Text(
                    "Приймання замовлень 11:00-18:00",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 5, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/phoneIcon.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          "(050) 202 00 55",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/plusIcon.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MediaQuery.of(context).size.width < 1400
                    ? TextButton(
                        onPressed: () {
                          widget.changeContentWidget(OrderPage(
                            price: totalPrice,
                            changeBasket: widget.BasketChangedDel,
                            changeBasketAdd: widget.BasketChangedAdd,
                            key: contentWidgetKey,
                          ));
                        },
                        child: Container(
                          child: Text(
                            "Перейти до замовлення",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      )
                    : Container(),
                MediaQuery.of(context).size.width < 1400
                    ? Container(
                        alignment: Alignment.center,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            items: menu_items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  item.split("*")[1]),
                                              fit: BoxFit.fitHeight,
                                            )),
                                            alignment: Alignment.topCenter,
                                          ),
                                          Container(
                                            child: Text(
                                              item.split("*")[0],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                            value: currentValue,
                            onChanged: (String? value) {
                              setState(() {
                                currentValue = value;
                              });
                              if (value ==
                                  "Фірмові роли*assets/SignatureSushi.png") {
                                widget.changeContentWidget(Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(30, 50, 30, 50),
                                      child: Text("Фірмові роли",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SushiList(
                                      changeBasket: widget.BasketChangedAdd,
                                      sushiList: firmovi,
                                    ),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: firmovi),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: firmovi),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: firmovi),
                                  ],
                                ));
                              }
                              if (value ==
                                  "Філадельфія*assets/SushiPhiladelphia.png")
                                widget.changeContentWidget(Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(30, 50, 30, 50),
                                      child: Text("Філадельфія",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: philadelphia),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: philadelphia),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: philadelphia),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: philadelphia),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: philadelphia),
                                  ],
                                ));

                              if (value ==
                                  "Класичні роли*assets/ClassicSushi.png")
                                widget.changeContentWidget(Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(30, 50, 30, 50),
                                      child: Text("Класичні роли",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: classic),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: classic),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: classic),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: classic),
                                  ],
                                ));

                              if (value == "Макі*assets/SushiMaki.png")
                                widget.changeContentWidget(Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(30, 50, 30, 50),
                                      child: Text("Макі",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: maki),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: maki),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: maki),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: maki),
                                  ],
                                ));
                              if (value == "Суші*assets/Sushi.png")
                                widget.changeContentWidget(Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.fromLTRB(30, 50, 30, 50),
                                      child: Text("Суші",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: sushi),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: sushi),
                                    SushiList(
                                        changeBasket: widget.BasketChangedAdd,
                                        sushiList: sushi),
                                  ],
                                ));
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 175,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              width: 175,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(250, 249, 249, 1.0),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                              elevation: 0,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: 175,
                        height: 50,
                      )
                    : Container(),
                TextButton(
                  onPressed: () {
                    widget.changeContentWidget(contentWidget = SalesWidget(
                      changeBasket: widget.BasketChangedAdd,
                    ));
                  },
                  child: Container(
                    child: Text(
                      "Акції",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.changeContentWidget(AboutUs());
                  },
                  child: Container(
                    child: Text(
                      "Про нас",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    widget.changeContentWidget(DeliveryInfo());
                  },
                  child: Container(
                    child: Text(
                      "Доставка по Дніпру",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
          ),
        ],
      ),
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(60, 80, 60, 20),
            child: Text("Суші у Дніпрі",
                style: TextStyle(
                    fontSize: 35,
                    color: Color.fromRGBO(122, 187, 102, 1),
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(60, 0, 60, 20),
            child: Text("Замовити суші у Дніпрі з безкоштовною доставкою"),
          ),
          Container(
            //  height: 400,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(60, 0, 60, 50),
            child: Text(
                "Nisl justo bibendum in tellus auctor tempor sed. Neque, nibh laoreet semper ultricies amet accumsan, feugiat. Auctor velit odio ullamcorper arcu diam. Ac semper sem enim nam elit fermentum, vitae. Adipiscing in netus netus proin in tellus sit. Dapibus urna amet sapien, amet. Pellentesque tempus non orci tortor nullam. Et at amet quis egestas. Quisque morbi fermentum vestibulum quis. Tellus scelerisque fermentum ipsum molestie magna ut est. Ac quam nulla ipsum porta enim, vestibulum vulputate mauris diam. Donec ac vitae, viverra turpis sit eu, adipiscing dis et. Facilisis augue accumsan neque, maecenas aliquet. In et tincidunt erat vitae vel mi neque faucibus. Sed condimentum elit gravida ultricies varius. Commodo, nulla bibendum aliquet iaculis pellentesque. Morbi sodales at adipiscing libero commodo, maecenas sit tellus arcu. Fringilla quis ac, at ultricies lorem. Tortor pretium aliquam purus tellus mattis nunc cursus. Gravida tortor aenean et, at enim. Pharetra egestas at nulla lectus lectus orci, ornare risus. "),
          ),
        ],
      ),
    );
  }
}

class BottomContacts extends StatefulWidget {
  final Function(Product, bool) changeBasketAdd;
  final Function(Widget) changeContentWidget;

  const BottomContacts({
    required this.changeBasketAdd,
    required this.changeContentWidget, super.key});

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
          height: 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 280,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/small_logo.png'),
                        fit: BoxFit.fitWidth,
                      )),
                      height: 64,
                      width: 200,
                    ),
                    TextButton(
                        onPressed: () {
                          widget.changeContentWidget(contentWidget = SalesWidget(
                            changeBasket: widget.changeBasketAdd,
                          ));
                          },
                        child: Container(
                          width: 200,
                          child: Text(
                            "Акції",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        )),

                    TextButton(
                        onPressed: () {
                          widget.changeContentWidget(AboutUs());
                        },
                        child: Container(
                          width: 200,
                          child: Text(
                            "Про нас",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        )),

                    TextButton(
                        onPressed: () {
                          widget.changeContentWidget(DeliveryInfo());
                        },
                        child: Container(
                          width: 200,
                          child: Text(
                            "Доставка та оплата",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        )),
                    SizedBox(
                      width: 1,
                      height: 60,
                    ),
                  ],
                ),
              ),
              Container(
                width: 440,
                height: 220,
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                                      Icons.location_on,
                                      color: Color.fromRGBO(122, 187, 102, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      "м. Дніпро, Панікахи, 17",
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
                                      "м. Дніпро, Панікахи, 17",
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
                                      "м. Дніпро, Панікахи, 17",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  width: 1,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                          Container(
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
                                      "+38 (050) 20 500 55",
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
                                      "+38 (050) 20 500 55",
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
                                      "+38 (050) 20 500 55",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            Text(
                              "Щомісяця проводяться різні привабливі акції.\nПідписуйтесь на наші соціальні мережі!",
                              style: TextStyle(
                                fontSize: 14,
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
          color: Colors.white,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(242, 242, 242, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: 40,
            width: MediaQuery.of(context).size.width >= 1400
                ? 1000
                : MediaQuery.of(context).size.width * 0.9,
            child: Text("© 2023 SuCheff Все права защищены"),
          ),
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
