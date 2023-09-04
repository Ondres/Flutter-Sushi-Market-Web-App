import 'package:flutter/material.dart';

class DeliveryInfo extends StatefulWidget {
  const DeliveryInfo({super.key});

  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 940,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular((20))),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 40, 0, 60),
            child: Text("Доставка та оплата", style: TextStyle(
              color: Color.fromRGBO(255, 141, 64, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular((40))),
                      image: DecorationImage(
                        image: AssetImage('assets/delivery.png'),
                        fit: BoxFit.cover,
                      )
                  )),
                Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("Оформлення замовлень", style: TextStyle(
                          color: Color.fromRGBO(255, 141, 64, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                        width: 560,
                      ),
                      Container(
                        width: 560,
                        child: Text("1.  По телефону. У такому разі ви можете обговорити всі деталі замовлення безпосередньо з оператором, який заповнить всю необхідну інформацію;\n2. На сайті. Для цього вам необхідно вибрати цікаві для вас позиції та додати їх до кошика. Після визначитись, будете забирати самі чи вам потрібна доставка (здійснюється лише до під’їзду).", style: TextStyle(
                          fontSize: 16,
                        ),),
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
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("Оплата", style: TextStyle(
                          color: Color.fromRGBO(255, 141, 64, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                        width: 560,
                      ),
                      Container(
                        width: 560,
                        child: Text("1. При самовивозі ви можете розрахуватись як готівкою так і карткою; \n2. При доставці, оплата проводиться переказом на розрахунковий рахунок в повному обсязі з урахуванням суми доставки (якщо є).", style: TextStyle(
                          fontSize: 18,
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/paymentInfo.png'),
                          fit: BoxFit.cover,
                        )
                    )),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/deliveryInfo.png'),
                          fit: BoxFit.cover,
                        )
                    )),
                Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("Доставка", style: TextStyle(
                          color: Color.fromRGBO(255, 141, 64, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                        width: 560,
                      ),
                      Container(
                        width: 560,
                        child: Text(
                          "1. Замовлення «на зараз». Середній час доставки, в позначеній зоні, від 60-90хв з моменту вашого дзвінка або оформлення на сайті (в останньому, після дзвінка оператора для уточнення замовлення);"
                              '\n*Час доставки рахується після сплати замовлення в повному обсязі'
                              ' \n2. На відведену годину. Ви отримуєте замовлення у відведений вами час (+/- 10хв);'
                              '\n3. Замовлення на доставку приймаються не пізніше 60хв до завершення робочого дня.',
                           style: TextStyle(
                          fontSize: 16,
                        ),),
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
