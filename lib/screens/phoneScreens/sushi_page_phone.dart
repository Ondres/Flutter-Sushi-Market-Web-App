import 'package:flutter/material.dart';
import 'package:sushi/menu/SushiClass.dart';
import 'package:sushi/menu/menu_lists.dart';

class SushiListPhone extends StatefulWidget {
  final Function(Product, bool) changeBasket;
  final List<Product> sushiList;
  final Function(Product, bool, {int? items}) changeBasketDel;

  SushiListPhone({
    Key? key,
    required this.changeBasketDel,
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
    List<int?> cntN = List<int?>.filled(18, 0);
    for (int i = 0; i < sushiList.length; i++) {
      cntN[i] = counters[sushiList[i]];
    }
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 265,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SushiItem(
                      index: 0,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                  SushiItem(
                      index: 1,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                ])),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 265,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SushiItem(
                      index: 2,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                  SushiItem(
                      index: 3,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                ])),
        sushiList.length > 4?
        Container(
            width: MediaQuery.of(context).size.width,
            height: 265,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SushiItem(
                      index: 4,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                  SushiItem(
                      index: 5,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                ])):Container(),
        sushiList.length == 7
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 265,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SushiItem(
                      index: 6,
                      sushiList: sushiList,
                      changeBasket: widget.changeBasket,
                      changeBasketDel: widget.changeBasketDel,
                      cntN: cntN),
                ]))
            : Container(),
        sushiList.length > 7
            ? Container(
                width: MediaQuery.of(context).size.width,
             //   height: 265,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SushiItem(
                              index: 6,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                          SushiItem(
                              index: 7,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SushiItem(
                              index: 8,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                          SushiItem(
                              index: 9,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SushiItem(
                              index: 10,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                          SushiItem(
                              index: 11,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SushiItem(
                              index: 12,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                          SushiItem(
                              index: 13,
                              sushiList: sushiList,
                              changeBasket: widget.changeBasket,
                              changeBasketDel: widget.changeBasketDel,
                              cntN: cntN),
                        ]),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}

void showAlertDialog(
  BuildContext context,
  Product sushiTtem,
  Function func,
) {
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
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          sushiTtem.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          sushiTtem.weight,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(27, 57, 119, 1),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.8,
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
                        width: MediaQuery.of(context).size.width * 0.8,
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
                                  primary: Color.fromRGBO(27, 57, 119, 1),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  minimumSize: Size(100, 45),
                                ),
                                onPressed: () {
                                  if (counters.containsKey(sushiTtem)) {
                                    int k = counters[sushiTtem]!;
                                    k++;
                                    counters[sushiTtem] = k;
                                  } else
                                    counters[sushiTtem] = 1;
                                  func(sushiTtem, false);
                                },
                                child: Text(
                                  'Замовити',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      );
    },
  );
}

class SushiItem extends StatefulWidget {
  SushiItem(
      {super.key,
      required this.index,
      required this.sushiList,
      required this.changeBasket,
      required this.changeBasketDel,
      required this.cntN});

  int index;
  final Function(Product, bool) changeBasket;
  final List<Product> sushiList;
  final Function(Product, bool, {int? items}) changeBasketDel;
  List<int?> cntN;

  @override
  State<SushiItem> createState() => _SushiItemState();
}

class _SushiItemState extends State<SushiItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 260,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                showAlertDialog(context, widget.sushiList[widget.index],
                    widget.changeBasket);
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
                      image: AssetImage(widget.sushiList[widget.index].image),
                      fit: BoxFit.fitWidth,
                    )),
              )),
          Container(
            height: 45,
            margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text(
              widget.sushiList[widget.index].name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 15,
            margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text("Вага: " + widget.sushiList[widget.index].weight),
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
                  widget.sushiList[widget.index].price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                widget.cntN[widget.index] != null &&
                        widget.cntN[widget.index] != 0
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          primary: Color.fromRGBO(27, 57, 119, 1),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: Size(35, 35),
                        ),
                        onPressed: () {
                          if (counters
                              .containsKey(widget.sushiList[widget.index])) {
                            setState(() {
                              int k = counters[widget.sushiList[widget.index]]!;
                              if (k != 0) {
                                k--;
                                widget.changeBasketDel(
                                    widget.sushiList[widget.index], true);
                              }
                              counters[widget.sushiList[widget.index]] = k;
                            });
                          } else
                            counters[widget.sushiList[widget.index]] = 0;

                          setState(() {
                            if (widget.cntN[widget.index] != 0 &&
                                widget.cntN[widget.index] != null) {
                              int c = widget.cntN[widget.index]!;
                              c--;
                              widget.cntN[widget.index] = c;
                            }
                          });
                        },
                        child: Text('-'),
                      )
                    : Container(
                        width: 35,
                      ),
                widget.cntN[widget.index] != null &&
                        widget.cntN[widget.index] != 0
                    ? Text(
                        widget.cntN[widget.index].toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Container(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color.fromRGBO(27, 57, 119, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(35, 35),
                  ),
                  onPressed: () {
                    print(widget.cntN[widget.index]);
                    setState(() {
                      if (widget.cntN[widget.index] == null)
                        widget.cntN[widget.index] = 1;
                      else {
                        int c = widget.cntN[widget.index]!;
                        c++;
                        widget.cntN[widget.index] = c;
                      }
                    });
                    print(widget.cntN[widget.index]);
                    if (counters.containsKey(widget.sushiList[widget.index])) {
                      setState(() {
                        int k = counters[widget.sushiList[widget.index]]!;
                        k++;
                        counters[widget.sushiList[widget.index]] = k;
                      });
                    } else
                      counters[widget.sushiList[widget.index]] = 1;
                    widget.changeBasket(widget.sushiList[widget.index], false);
                  },
                  child: Text('+'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
