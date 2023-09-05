import 'package:flutter/material.dart';
import 'package:sushi/menu/SushiClass.dart';

import '../menu/menu_lists.dart';

class SushiList extends StatefulWidget {

  final Function(Product, bool) changeBasket;
  final List<Product> sushiList;

  SushiList({Key? key, required this.sushiList, required this.changeBasket}) : super(key: key);

  @override
  State<SushiList> createState() => _SushiListState();
}

class _SushiListState extends State<SushiList> {
  @override
  Widget build(BuildContext context) {
    // Использование параметра sushiList
    List<Product> sushiList = widget.sushiList;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 1000,
          height: 380,
          child: ListView.builder(
            itemCount: sushiList.length,
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
                          showAlertDialog(context, sushiList[index], widget.changeBasket);
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
                                image: AssetImage(sushiList[index].image),
                                fit: BoxFit.cover,
                              )),
                        )),
                    Container(
                      height: 35,
                      margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                      child: Text(
                        sushiList[index].name,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      height: 15,
                      margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                      child: Text("Вага: " + sushiList[index].weight),
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
                            sushiList[index].price,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(27, 57, 119, 1),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              minimumSize: Size(100, 45),
                            ),
                            onPressed: () {
                              if(counters.containsKey(sushiList[index])) {
                                setState(() {
                                  int k = counters[sushiList[index]]!;
                                  k++;
                                  counters[sushiList[index]] = k;
                                });
                              }
                              else
                                counters[sushiList[index]] = 1;
                              widget.changeBasket(sushiList[index], false);
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
      ],
    );
  }
}

void showAlertDialog(BuildContext context, Product sushiTtem, Function func,) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Устанавливаем радиус закругления
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        content: Container(
          color: Colors.transparent,
          width: 700,
          height: 310,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular((20))),
                    image: DecorationImage(
                      image: AssetImage(sushiTtem.image),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                height: 350,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      child: Text(
                        sushiTtem.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      child: Text(
                        sushiTtem.weight,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: 300,
                        child: Text(
                          sushiTtem.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 300,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            sushiTtem.price,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10, width: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(27, 57, 119, 1),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              minimumSize: Size(100, 45),
                            ),
                            onPressed: () {
                              if(counters.containsKey(sushiTtem)) {
                                  int k = counters[sushiTtem]!;
                                  k++;
                                  counters[sushiTtem] = k;
                              }
                              else
                                counters[sushiTtem] = 1;
                              func(sushiTtem, false);
                              },
                            child: Text('Замовити'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
