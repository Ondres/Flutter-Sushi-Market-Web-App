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
                        width: 560,
                        child: Text("Amet amet, ornare ipsum, praesent. Sollicitudin suspendisse fames leo, volutpat at. A mi, sapien et et nulla massa. Rhoncus vel maecenas est nisi aliquet. Neque elementum faucibus scelerisque ultrices netus aliquam neque. Interdum quis auctor felis cras velit mauris. Eros in tellus pellentesque gravida feugiat facilisi mauris. At in mauris condimentum ornare auctor feugiat nullam ut. Donec duis scelerisque lobortis arcu, urna purus pulvinar.", style: TextStyle(
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
                        child: Text("Amet amet, ornare ipsum, praesent. Sollicitudin suspendisse fames leo, volutpat at. A mi, sapien et et nulla massa. Rhoncus vel maecenas est nisi aliquet. Neque elementum faucibus scelerisque ultrices netus aliquam neque. Interdum quis auctor felis cras velit mauris. Eros in tellus pellentesque gravida feugiat facilisi mauris. At in mauris condimentum ornare auctor feugiat nullam ut. Donec duis scelerisque lobortis arcu, urna purus pulvinar.", style: TextStyle(
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
                        width: 560,
                        child: Text("Amet amet, ornare ipsum, praesent. Sollicitudin suspendisse fames leo, volutpat at. A mi, sapien et et nulla massa. Rhoncus vel maecenas est nisi aliquet. Neque elementum faucibus scelerisque ultrices netus aliquam neque. Interdum quis auctor felis cras velit mauris. Eros in tellus pellentesque gravida feugiat facilisi mauris. At in mauris condimentum ornare auctor feugiat nullam ut. Donec duis scelerisque lobortis arcu, urna purus pulvinar.", style: TextStyle(
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
