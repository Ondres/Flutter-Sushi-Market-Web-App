import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            child: Text("про SuCheff", style: TextStyle(
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
                          image: AssetImage('assets/teamInfo.png'),
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
                        child: Text("Команда", style: TextStyle(
                          color: Color.fromRGBO(255, 141, 64, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                        width: 560,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 50),
                        width: 560,
                        child: Text(
                          "Наша команда - це висококваліфіковані фахівці з багаторічним досвідом у приготуванні смачних суші та ролів. Ми вкладаємо велику душу у кожну страву, віддаючи перевагу найкращим інгредієнтам та техніці. Наша мета - подарувати вам незабутню кулінарну подорож, де кожен ковзаючий рол є маленьким шедевром. Долучайтеся до нашого смачного світу суші!",
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
                        child: Text("Меню", style: TextStyle(
                          color: Color.fromRGBO(255, 141, 64, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                        width: 560,
                      ),
                      Container(
                        width: 560,
                        child: Text(
                          "Наше меню - це справжній шлях у світ смаків, де кожен знайде своє улюблене блюдо. Від смаку Аляски до аромату Пекіна, від класичних Філадельфії до сучасних Каліфорній – ми пропонуємо різноманітність, щоб задовольнити ваші гастрономічні побажання. Наші суші - це подорож на непередбачуваній кулінарній карті, де смаки зустрічаються та танцюють у гармонії.",
                           style: TextStyle(
                          fontSize: 16,
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
                          image: AssetImage('assets/menuInfo.png'),
                          fit: BoxFit.cover,
                        )
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
