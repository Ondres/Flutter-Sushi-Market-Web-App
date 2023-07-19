import 'package:flutter/material.dart';
import 'package:sushi/menu/SushiClass.dart';
import 'package:sushi/menu/menu_lists.dart';


class SushiListPhone extends StatefulWidget {
  final Function(Product, bool) changeBasket;
  final List<Product> sushiList;
  final int? row;

  SushiListPhone({
    this.row,
    Key? key,
    required this.sushiList,
    required this.changeBasket,
  }) : super(key: key);

  @override
  State<SushiListPhone> createState() => _SushiListPhoneState();
}


class _SushiListPhoneState extends State<SushiListPhone> {
  @override
  Widget build(BuildContext context) {

    List<Product> sushiList = widget.sushiList;
    if(widget.row!=null)
      setState(() {
        int a = (MediaQuery.of(context).size.width/165).toInt();
        int b = (widget.row!*a).toInt();
        int c = a + b;
        sushiList = widget.sushiList.sublist(b,c);
      });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 260,
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
                height: 250,
                width: 165,
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
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: Colors.black26,
                              image: DecorationImage(
                                image: AssetImage(sushiList[index].image),
                                fit: BoxFit.fitWidth,
                              )),
                        )),
                    Container(
                      height: 35,
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
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
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Text("Вага: " + sushiList[index].weight),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 40,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            sushiList[index].price,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
        contentPadding: EdgeInsets.all(15),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        content: Container(
          width: MediaQuery.of(context).size.width,
          height: 410,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular((20))),
                    image: DecorationImage(
                      image: AssetImage(sushiTtem.image),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text(
                        sushiTtem.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text(
                        sushiTtem.weight,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text(
                          sushiTtem.description,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.8,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sushiTtem.price,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10, width: 30),
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
                              if(counters.containsKey(sushiTtem)) {
                                  int k = counters[sushiTtem]!;
                                  k++;
                                  counters[sushiTtem] = k;
                              }
                              else
                                counters[sushiTtem] = 1;
                              func(sushiTtem, false);
                            },
                            child: Text('Замовити',
                              style: TextStyle(
                              fontSize: 16, ),)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )

        ),
      );
    },
  );
}
