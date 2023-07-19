import 'package:flutter/material.dart';

class DeliveryInfoPhone extends StatefulWidget {
  const DeliveryInfoPhone({super.key});

  @override
  State<DeliveryInfoPhone> createState() => _DeliveryInfoPhoneState();
}

class _DeliveryInfoPhoneState extends State<DeliveryInfoPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular((20))),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 40, 0, 60),
            child: Text(
              "Доставка та оплата",
              style: TextStyle(
                color: Color.fromRGBO(255, 141, 64, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/delivery.png'),
                          fit: BoxFit.cover,
                        ))),
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Ваше \nзамовлення",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 141, 64, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width/3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          " At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Оплата",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 141, 64, 1),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width/3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          " At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/paymentInfo.png'),
                          fit: BoxFit.cover,
                        ))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/paymentInfo.png'),
                          fit: BoxFit.cover,
                        ))),
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Доставка",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 141, 64, 1),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width/3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          " At in mauris condimentum onec duis scelerisque lobortis arcu, urna purus pulvinar.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
