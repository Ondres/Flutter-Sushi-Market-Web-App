import 'package:flutter/material.dart';
import 'package:sushi/screens/phoneScreens/sushi_page_phone.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../menu/SushiClass.dart';
import '../menu/menu_lists.dart';
import 'phoneScreens/about_us_page_phone.dart';
import 'phoneScreens/dilivery_info_page_phone.dart';
import 'phoneScreens/main_page_phone.dart';
import 'phoneScreens/order_page_phone.dart';

class PhoneScreen extends StatefulWidget {
  final Function(Widget) changeContentWidget;
  final Function(Product product, bool same) BasketChangedAdd;
  final Function(Product product, bool same, {int? items}) BasketChangedDel;

  const PhoneScreen(
      {super.key,
      required this.changeContentWidget,
      required this.BasketChangedAdd,
      required this.BasketChangedDel});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          padding: EdgeInsets.only(right: 100),
                          child: Container(
                            width: 190,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/small_logo.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton(
                          onPressed: () {
                            widget.changeContentWidget(SalesWidget(
                              changeBasket: widget.BasketChangedAdd,
                            ));
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            height: 50,
                            child: Text(
                              "Акції та новини",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        items: menu_items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        margin: EdgeInsets.only(right: 5),
                                        child: Text(
                                          " " + item.split("*")[0],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(item.split("*")[1]),
                                          fit: BoxFit.fitHeight,
                                        )),
                                        alignment: Alignment.topCenter,
                                      ),
                                    ],
                                  )),
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
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                                  child: Text("Фірмові роли",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(255, 141, 64, 1),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                              ],
                            ));
                          }
                          if (value ==
                              "Філадельфія*assets/SushiPhiladelphia.png")
                            widget.changeContentWidget(Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                                  child: Text("Філадельфія",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(255, 141, 64, 1),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                              ],
                            ));

                          if (value == "Класичні роли*assets/ClassicSushi.png")
                            widget.changeContentWidget(Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                                  child: Text("Класичні роли",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(255, 141, 64, 1),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                              ],
                            ));

                          if (value == "Макі*assets/SushiMaki.png")
                            widget.changeContentWidget(Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                                  child: Text("Макі",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(255, 141, 64, 1),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                              ],
                            ));
                          if (value == "Суші*assets/Sushi.png")
                            widget.changeContentWidget(Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                                  child: Text("Суші",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(255, 141, 64, 1),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 0,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 1,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 2,
                                ),
                                SushiListPhone(
                                  changeBasket: widget.BasketChangedAdd,
                                  sushiList: firmovi_roll,
                                  row: 3,
                                ),
                              ],
                            ));

                          Navigator.pop(context);
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: MediaQuery.of(context).size.width * 0.75,
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
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      widget.changeContentWidget(DeliveryInfoPhone());
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      child: Text(
                        "Доставка по Дніпру",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.changeContentWidget(AboutUsPhone());
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      child: Text(
                        "Про нас",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.changeContentWidget(OrderPagePhone(
                        price: totalPrice,
                        changeBasket: widget.BasketChangedDel,
                        changeBasketAdd: widget.BasketChangedAdd,
                        key: contentWidgetKey,
                      ));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      child: Text(
                        "Перейти до замовлення",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height - 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 45,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            "Приймання замовлень 11:00-18:00",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          margin: EdgeInsets.only(bottom: 15),
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/phoneIcon.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
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
                                width: 32,
                                height: 32,
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
                ],
              ),
            ],
          ),
        ),
        body: Container(
            color: Color.fromRGBO(242, 242, 242, 1),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PhoneTopWidget(
                        changeContentWidget: widget.changeContentWidget,
                        BasketChangedAdd: widget.BasketChangedAdd,
                      ),
                      contentWidget,
                      Visibility(
                        visible: contentWidget.key != contentWidgetKey,
                        child: BottomInfo(),
                      ),
                      BottomContacts(),
                    ],
                  );
                })));
  }
}

class PhoneTopWidget extends StatefulWidget {
  final Function(Product product, bool same) BasketChangedAdd;
  final Function(Widget) changeContentWidget;

  const PhoneTopWidget(
      {super.key,
      required this.BasketChangedAdd,
      required this.changeContentWidget});

  @override
  State<PhoneTopWidget> createState() => _PhoneTopWidgetState();
}

class _PhoneTopWidgetState extends State<PhoneTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color.fromRGBO(255, 141, 64, 1),
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          InkWell(
            onTap: () {
              widget.changeContentWidget(SalesWidget(
                changeBasket: widget.BasketChangedAdd,
              ));
            },
            child: Image.asset(
              'assets/small_logo.png',
              width: 200,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
