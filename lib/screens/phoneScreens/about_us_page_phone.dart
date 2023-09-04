import 'package:flutter/material.dart';

class AboutUsPhone extends StatefulWidget {
  const AboutUsPhone({super.key});

  @override
  State<AboutUsPhone> createState() => _AboutUsPhoneState();
}

class _AboutUsPhoneState extends State<AboutUsPhone> {
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
              "про SuCheff",
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
                    width: MediaQuery.of(context).size.width / 2,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((40))),
                        image: DecorationImage(
                          image: AssetImage('assets/teamInfo.png'),
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
                          "Команда",
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
                          "Наша команда - це професіонали з багатим досвідом у мистецтві суші.",
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
                          "Меню",
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
                          "Кожен знайде щось за своїм смаком у нашому різноманітному асортименті.",
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
                          image: AssetImage('assets/menuInfo.png'),
                          fit: BoxFit.cover,
                        ))),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
