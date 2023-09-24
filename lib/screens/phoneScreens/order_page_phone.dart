import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sushi/menu/SushiClass.dart';
import 'package:sushi/menu/added_item.dart';
import 'package:sushi/menu/menu_lists.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

import 'main_page_phone.dart';

Telegram telegram = Telegram('6353872424:AAHgh2m-XF9oopTddBOzxjvElkKy-4zIjjQ');

final TextEditingController phoneController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController commentController = TextEditingController();
final TextEditingController streetController = TextEditingController();
final TextEditingController houseController = TextEditingController();
final TextEditingController apartmentController = TextEditingController();
var sauces = 1;
bool C = true;
bool cash = true;
bool courier = true;
String? selectedValue = "Святослава Хороброго, 24";

final List<String> items = [
  'Святослава Хороброго, 24',
  'м.Дніпро, Роторна, 23',
  'м.Дніпро, Чкалова, 24',
];

class OrderPagePhone extends StatefulWidget {
  final Function(Product, bool, {int? items}) changeBasket;
  final Function(Product, bool) changeBasketAdd;
  int price;

  OrderPagePhone({
    super.key,
    required this.price,
    required this.changeBasket,
    required this.changeBasketAdd,
  });

  @override
  State<OrderPagePhone> createState() => _OrderPagePhoneState();
}

class _OrderPagePhoneState extends State<OrderPagePhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: !basket.isEmpty ? 910 : 680,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: phoneController,
                            onChanged: (value) {
                              setState(() {
                                C = !C;
                              });
                            },
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
                            minLines: 1,
                            maxLines: 1,
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Ім`я',
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
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 1,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 75,
                        margin: EdgeInsets.only(top: 20),
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
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: !courier ? 160 : 100,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  height: 50,
                                )),
                          ],
                        ),
                      ),
                      !courier
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: TextField(
                                controller: streetController,
                                onChanged: (value) {
                                  setState(() {
                                    C = !C;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Адреса',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(157, 155, 155, 1),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide.none, // Скрываем границу
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 1,
                              ))
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: !basket.isEmpty ? 260 : 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      !basket.isEmpty
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular((10))),
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
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 24,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular((10))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 130,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Кількість персон",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.38,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                      color: Color.fromRGBO(
                                                          27, 57, 119, 1),
                                                    )))),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    )),
                Container(
                  height: 20,
                  margin: EdgeInsets.all(10),
                  child: Text((streetController.text.isEmpty || phoneController.text.isEmpty)&&
                          !courier
                      ? "Введіть номер телефона та адресу"
                      : phoneController.text.isEmpty && courier
                          ? "Введіть номер телефону"
                          : ""),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  ),
                  onPressed: () async {
                    if ((!streetController.text.isEmpty &&
                            !courier &&
                            !phoneController.text.isEmpty) ||
                        (!phoneController.text.isEmpty && courier)) {
                      await _startBot();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(); // Вызов нашего алерт-диалога
                        },
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: Text(
                      "Відправити форму",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular((10))),
                      color: (!streetController.text.isEmpty &&
                                  !courier &&
                                  !phoneController.text.isEmpty) ||
                              (!phoneController.text.isEmpty && courier)
                          ? Color.fromRGBO(27, 57, 119, 1)
                          : Colors.grey,
                    ),
                  ),
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
      "адреса: ${streetController.text}\n" +
      "кількість персон: " +
      sauces.toString();
  !courier ? Order += "\nДоставка кур'єром" : Order += "\nСамовивіз";
  Order += "\nЗамовлення: ";
  for (int i = 0; i < basket.length; i++)
    Order += basket[i].name + " " + counters[basket[i]].toString() + " шт., \n";
  Order += "Всього до сплати: " + totalPrice.toString();
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
