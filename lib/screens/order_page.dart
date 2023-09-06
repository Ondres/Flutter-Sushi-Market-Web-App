import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sushi/menu/menu_lists.dart';
import 'package:sushi/screens/main_page.dart';
import '../menu/SushiClass.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

import '../menu/added_item.dart';

Telegram telegram = Telegram('6353872424:AAHgh2m-XF9oopTddBOzxjvElkKy-4zIjjQ');

final TextEditingController phoneController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController commentController = TextEditingController();
final TextEditingController streetController = TextEditingController();
final TextEditingController houseController = TextEditingController();
final TextEditingController apartmentController = TextEditingController();
var sauces = 1;
bool cash = true;
bool courier = true;
String? selectedValue = "м.Дніпро, Панікахи, 17";

final List<String> items = [
  'м.Дніпро, Панікахи, 17',
  'м.Дніпро, Роторна, 23',
  'м.Дніпро, Чкалова, 24',
];

class OrderPage extends StatefulWidget {
  final Function(Product, bool, {int? items}) changeBasket;
  final Function(Product, bool) changeBasketAdd;
  int price;
  OrderPage({
    super.key,
    required this.price,
    required this.changeBasket,
    required this.changeBasketAdd,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 1000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
           // color: Colors.blue,
            margin: EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 340,
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 40),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: 'Телефон',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(157, 155, 155, 1),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.phone,
                            // задайте необходимые размеры для поля ввода
                            minLines: 1,
                            maxLines: 1,
                            // maxLength: 15,
                          )),
                      Container(
                          width: 200,
                          height: 50,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Ім'я",
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(157, 155, 155, 1),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none, // Скрываем границу
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 1,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  height: 340,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 70,
                        padding: EdgeInsets.all(0),
                        child: TextField(
                          controller: commentController,
                          decoration: InputDecoration(
                            hintText: 'Коментарі',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(157, 155, 155, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none, // Скрываем границу
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          minLines: 3,
                          maxLines: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular((10))),
                          color: Colors.white,
                        ),
                      ),
                      !courier?
                      Container(
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextField(
                            controller: streetController,
                            decoration: InputDecoration(
                              hintText: 'Адреса',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(157, 155, 155, 1),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none, // Скрываем границу
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 1,
                          )):Container(),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  height: 340,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.zero),
                                ),
                                onPressed: () {
                                  setState(() {
                                    courier = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Самовивіз",
                                    style: TextStyle(
                                        color: courier
                                            ? Colors.white
                                            : Color.fromRGBO(157, 155, 155, 1)),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular((10))),
                                    color: courier
                                        ? Color.fromRGBO(27, 57, 119, 1)
                                        : Colors.white,
                                  ),
                                  width: 90,
                                  height: 50,
                                )),
                            TextButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.zero),
                                ),
                                onPressed: () {
                                  setState(() {
                                    courier = false;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Кур'єром",
                                    style: TextStyle(
                                      color: courier
                                          ? Color.fromRGBO(157, 155, 155, 1)
                                          : Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular((10))),
                                    color: courier
                                        ? Colors.white
                                        : Color.fromRGBO(27, 57, 119, 1),
                                  ),
                                  width: 90,
                                  height: 50,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  height: 340,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 220,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular((10))),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          itemCount: basket.length,
                          itemBuilder: (context, index) {
                            Product product = basket[index];
                            return AddedSushiItem(
                              product: product,
                              changeBasket: widget.changeBasket,
                              changeBasketAdd: widget.changeBasketAdd,
                              counters: counters,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 40,
                        width: 205,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular((10))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 115,
                              child: Text(
                                "Кількість персон",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                                width: 90,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 30,
                                            child: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.zero),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    sauces--;
                                                  });
                                                },
                                                child: Container(
                                                    width: 30,
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.dangerous,
                                                        size: 24,
                                                        color:
                                                            Colors.black54)))),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 30,
                                          child: Text(
                                            sauces.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 30,
                                            child: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.zero),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    sauces++;
                                                  });
                                                },
                                                child: Container(
                                                    width: 30,
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                        Icons.add_circle,
                                                        size: 24,
                                                        color: Color.fromRGBO(27, 57, 119, 1),)))),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        width: 210,
                        child: Text("Імбир, васабі та соєвий соус входять до замовлення",
                        style: TextStyle(
                          fontSize: 12,
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          !courier?Container(
            padding: EdgeInsets.only(left: 40),
            alignment: Alignment.centerLeft,
           // color: Colors.red,
            height: 27,
            child: Text(
              "Oплата проводиться лише переказом на розрахунковий рахунок в повному обсязі!",
              style: TextStyle(
                color: Colors.black54
              ),
            ),
          ):Container(
            height: 27,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  ),
                  onPressed: () async {
                    await _startBot();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(); // Вызов нашего алерт-диалога
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 700,
                    height: 50,
                    child: Text(
                      "Відправити форму",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular((10))),
                      color: Color.fromRGBO(27, 57, 119, 1),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Сума до сплати:  ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          totalPrice.toString() + '  ₴',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_startBot() async {
  final username = (await telegram.getMe()).username;
  final teleDart = TeleDart(
      '6353872424:AAHgh2m-XF9oopTddBOzxjvElkKy-4zIjjQ', Event(username!));
  teleDart.start();
  String Order = "";
  Order += "\nІм'я: ${nameController.text}\n" +
      "Телефон: ${phoneController.text}\n" +
      "Коментарі: ${commentController.text}\n" +
      "Адреса: ${streetController.text}\n" +
          "кількість людей: " +
      sauces.toString();
  !courier ? Order += "\nДоставка кур'єром" : Order += "\nСамовивіз";
  courier ? Order += "\nПункт видачі: " + selectedValue.toString() : "";
  Order += "\nЗамовлення: ";
  for (int i = 0; i < basket.length; i++) Order += basket[i].name + " " + counters[basket[i]].toString() + " шт., \n";
  Order+="Всього до сплати: "+totalPrice.toString();
  await teleDart.sendMessage(580706417, Order);
  teleDart.stop();
}

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ваше замовлення прийнято! Очікуйте на дзвінок :)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Якщо протягом п\'яти хвилин ви не отримаєте дзвінка, будь ласка подзвоніть нам',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Закрытие алерт-диалога при нажатии кнопки
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}