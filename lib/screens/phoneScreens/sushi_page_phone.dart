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
                  Container(
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
                              showAlertDialog(context, sushiList[0],
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
                                    image: AssetImage(sushiList[0].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                            sushiList[0].name,
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
                          child: Text("Вага: " + sushiList[0].weight),
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
                                sushiList[0].price,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              cntN[0] != null &&
                                  cntN[0] != 0
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
                                      .containsKey(sushiList[0])) {
                                    setState(() {
                                      int k = counters[sushiList[0]]!;
                                      if (k != 0) {
                                        k--;
                                        widget.changeBasketDel(
                                            sushiList[0], true);
                                      }
                                      counters[sushiList[0]] = k;
                                    });
                                  } else
                                    counters[sushiList[0]] = 0;

                                  setState(() {
                                    if (cntN[0] != 0 &&
                                        cntN[0] != null) {
                                      int c = cntN[0]!;
                                      c--;
                                      cntN[0] = c;
                                    }
                                  });
                                },
                                child: Text('-'),
                              )
                                  : Container(
                                width: 35,
                              ),
                              cntN[0] != null &&
                                  cntN[0] != 0
                                  ? Text(
                                cntN[0].toString(),
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
                                  print(cntN[0]);
                                  setState(() {
                                    if (cntN[0] == null)
                                      cntN[0] = 1;
                                    else {
                                      int c = cntN[0]!;
                                      c++;
                                      cntN[0] = c;
                                    }
                                  });
                                  print(cntN[0]);
                                  if (counters.containsKey(sushiList[0])) {
                                    setState(() {
                                      int k = counters[sushiList[0]]!;
                                      k++;
                                      counters[sushiList[0]] = k;
                                    });
                                  } else
                                    counters[sushiList[0]] = 1;
                                  widget.changeBasket(sushiList[0], false);
                                },
                                child: Text('+'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              showAlertDialog(context, sushiList[1],
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
                                    image: AssetImage(sushiList[1].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                            sushiList[1].name,
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
                          child: Text("Вага: " + sushiList[1].weight),
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
                                sushiList[1].price,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              cntN[1] != null &&
                                  cntN[1] != 0
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
                                      .containsKey(sushiList[1])) {
                                    setState(() {
                                      int k = counters[sushiList[1]]!;
                                      if (k != 0) {
                                        k--;
                                        widget.changeBasketDel(
                                            sushiList[1], true);
                                      }
                                      counters[sushiList[1]] = k;
                                    });
                                  } else
                                    counters[sushiList[1]] = 0;

                                  setState(() {
                                    if (cntN[1] != 0 &&
                                        cntN[1] != null) {
                                      int c = cntN[1]!;
                                      c--;
                                      cntN[1] = c;
                                    }
                                  });
                                },
                                child: Text('-'),
                              )
                                  : Container(
                                width: 35,
                              ),
                              cntN[1] != null &&
                                  cntN[1] != 0
                                  ? Text(
                                cntN[1].toString(),
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
                                  print(cntN[1]);
                                  setState(() {
                                    if (cntN[1] == null)
                                      cntN[1] = 1;
                                    else {
                                      int c = cntN[1]!;
                                      c++;
                                      cntN[1] = c;
                                    }
                                  });
                                  print(cntN[1]);
                                  if (counters.containsKey(sushiList[1])) {
                                    setState(() {
                                      int k = counters[sushiList[1]]!;
                                      k++;
                                      counters[sushiList[1]] = k;
                                    });
                                  } else
                                    counters[sushiList[1]] = 1;
                                  widget.changeBasket(sushiList[1], false);
                                },
                                child: Text('+'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ])),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 265,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                              showAlertDialog(context, sushiList[2],
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
                                    image: AssetImage(sushiList[2].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                            sushiList[2].name,
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
                          child: Text("Вага: " + sushiList[2].weight),
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
                                sushiList[2].price,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              cntN[2] != null &&
                                  cntN[2] != 0
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
                                      .containsKey(sushiList[2])) {
                                    setState(() {
                                      int k = counters[sushiList[2]]!;
                                      if (k != 0) {
                                        k--;
                                        widget.changeBasketDel(
                                            sushiList[2], true);
                                      }
                                      counters[sushiList[2]] = k;
                                    });
                                  } else
                                    counters[sushiList[2]] = 0;

                                  setState(() {
                                    if (cntN[2] != 0 &&
                                        cntN[2] != null) {
                                      int c = cntN[2]!;
                                      c--;
                                      cntN[2] = c;
                                    }
                                  });
                                },
                                child: Text('-'),
                              )
                                  : Container(
                                width: 35,
                              ),
                              cntN[2] != null &&
                                  cntN[2] != 0
                                  ? Text(
                                cntN[2].toString(),
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
                                  print(cntN[2]);
                                  setState(() {
                                    if (cntN[2] == null)
                                      cntN[2] = 1;
                                    else {
                                      int c = cntN[2]!;
                                      c++;
                                      cntN[2] = c;
                                    }
                                  });
                                  print(cntN[2]);
                                  if (counters.containsKey(sushiList[2])) {
                                    setState(() {
                                      int k = counters[sushiList[2]]!;
                                      k++;
                                      counters[sushiList[2]] = k;
                                    });
                                  } else
                                    counters[sushiList[2]] = 1;
                                  widget.changeBasket(sushiList[2], false);
                                },
                                child: Text('+'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              showAlertDialog(context, sushiList[3],
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
                                    image: AssetImage(sushiList[3].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                            sushiList[3].name,
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
                          child: Text("Вага: " + sushiList[3].weight),
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
                                sushiList[3].price,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              cntN[3] != null &&
                                  cntN[3] != 0
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
                                      .containsKey(sushiList[3])) {
                                    setState(() {
                                      int k = counters[sushiList[3]]!;
                                      if (k != 0) {
                                        k--;
                                        widget.changeBasketDel(
                                            sushiList[3], true);
                                      }
                                      counters[sushiList[3]] = k;
                                    });
                                  } else
                                    counters[sushiList[3]] = 0;

                                  setState(() {
                                    if (cntN[3] != 0 &&
                                        cntN[3] != null) {
                                      int c = cntN[3]!;
                                      c--;
                                      cntN[3] = c;
                                    }
                                  });
                                },
                                child: Text('-'),
                              )
                                  : Container(
                                width: 35,
                              ),
                              cntN[3] != null &&
                                  cntN[3] != 0
                                  ? Text(
                                cntN[3].toString(),
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
                                  print(cntN[3]);
                                  setState(() {
                                    if (cntN[3] == null)
                                      cntN[3] = 1;
                                    else {
                                      int c = cntN[3]!;
                                      c++;
                                      cntN[3] = c;
                                    }
                                  });
                                  print(cntN[3]);
                                  if (counters.containsKey(sushiList[3])) {
                                    setState(() {
                                      int k = counters[sushiList[3]]!;
                                      k++;
                                      counters[sushiList[3]] = k;
                                    });
                                  } else
                                    counters[sushiList[3]] = 1;
                                  widget.changeBasket(sushiList[3], false);
                                },
                                child: Text('+'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ])),
        sushiList.length > 4
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 265,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                                  showAlertDialog(context, sushiList[4],
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
                                        image: AssetImage(sushiList[4].image),
                                        fit: BoxFit.fitWidth,
                                      )),
                                )),
                            Container(
                              height: 45,
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                sushiList[4].name,
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
                              child: Text("Вага: " + sushiList[4].weight),
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
                                    sushiList[4].price,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  cntN[4] != null &&
                                      cntN[4] != 0
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
                                          .containsKey(sushiList[4])) {
                                        setState(() {
                                          int k = counters[sushiList[4]]!;
                                          if (k != 0) {
                                            k--;
                                            widget.changeBasketDel(
                                                sushiList[4], true);
                                          }
                                          counters[sushiList[4]] = k;
                                        });
                                      } else
                                        counters[sushiList[4]] = 0;

                                      setState(() {
                                        if (cntN[4] != 0 &&
                                            cntN[4] != null) {
                                          int c = cntN[4]!;
                                          c--;
                                          cntN[4] = c;
                                        }
                                      });
                                    },
                                    child: Text('-'),
                                  )
                                      : Container(
                                    width: 35,
                                  ),
                                  cntN[4] != null &&
                                      cntN[4] != 0
                                      ? Text(
                                    cntN[4].toString(),
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
                                      print(cntN[4]);
                                      setState(() {
                                        if (cntN[4] == null)
                                          cntN[4] = 1;
                                        else {
                                          int c = cntN[4]!;
                                          c++;
                                          cntN[4] = c;
                                        }
                                      });
                                      print(cntN[4]);
                                      if (counters.containsKey(sushiList[4])) {
                                        setState(() {
                                          int k = counters[sushiList[4]]!;
                                          k++;
                                          counters[sushiList[4]] = k;
                                        });
                                      } else
                                        counters[sushiList[4]] = 1;
                                      widget.changeBasket(sushiList[4], false);
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
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
                                  showAlertDialog(context, sushiList[5],
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
                                        image: AssetImage(sushiList[5].image),
                                        fit: BoxFit.fitWidth,
                                      )),
                                )),
                            Container(
                              height: 45,
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                sushiList[5].name,
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
                              child: Text("Вага: " + sushiList[5].weight),
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
                                    sushiList[5].price,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  cntN[5] != null &&
                                      cntN[5] != 0
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
                                          .containsKey(sushiList[5])) {
                                        setState(() {
                                          int k = counters[sushiList[5]]!;
                                          if (k != 0) {
                                            k--;
                                            widget.changeBasketDel(
                                                sushiList[5], true);
                                          }
                                          counters[sushiList[5]] = k;
                                        });
                                      } else
                                        counters[sushiList[5]] = 0;

                                      setState(() {
                                        if (cntN[5] != 0 &&
                                            cntN[5] != null) {
                                          int c = cntN[5]!;
                                          c--;
                                          cntN[5] = c;
                                        }
                                      });
                                    },
                                    child: Text('-'),
                                  )
                                      : Container(
                                    width: 35,
                                  ),
                                  cntN[5] != null &&
                                      cntN[5] != 0
                                      ? Text(
                                    cntN[5].toString(),
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
                                      print(cntN[5]);
                                      setState(() {
                                        if (cntN[5] == null)
                                          cntN[5] = 1;
                                        else {
                                          int c = cntN[5]!;
                                          c++;
                                          cntN[5] = c;
                                        }
                                      });
                                      print(cntN[5]);
                                      if (counters.containsKey(sushiList[5])) {
                                        setState(() {
                                          int k = counters[sushiList[5]]!;
                                          k++;
                                          counters[sushiList[5]] = k;
                                        });
                                      } else
                                        counters[sushiList[5]] = 1;
                                      widget.changeBasket(sushiList[5], false);
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]))
            : Container(),
        sushiList.length == 7
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 265,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
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
                                  showAlertDialog(context, sushiList[6],
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
                                        image: AssetImage(sushiList[6].image),
                                        fit: BoxFit.fitWidth,
                                      )),
                                )),
                            Container(
                              height: 45,
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                sushiList[6].name,
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
                              child: Text("Вага: " + sushiList[6].weight),
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
                                    sushiList[6].price,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  cntN[6] != null &&
                                      cntN[6] != 0
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
                                          .containsKey(sushiList[6])) {
                                        setState(() {
                                          int k = counters[sushiList[6]]!;
                                          if (k != 0) {
                                            k--;
                                            widget.changeBasketDel(
                                                sushiList[6], true);
                                          }
                                          counters[sushiList[6]] = k;
                                        });
                                      } else
                                        counters[sushiList[6]] = 0;

                                      setState(() {
                                        if (cntN[6] != 0 &&
                                            cntN[6] != null) {
                                          int c = cntN[6]!;
                                          c--;
                                          cntN[6] = c;
                                        }
                                      });
                                    },
                                    child: Text('-'),
                                  )
                                      : Container(
                                    width: 35,
                                  ),
                                  cntN[6] != null &&
                                      cntN[6] != 0
                                      ? Text(
                                    cntN[6].toString(),
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
                                      print(cntN[6]);
                                      setState(() {
                                        if (cntN[6] == null)
                                          cntN[6] = 1;
                                        else {
                                          int c = cntN[6]!;
                                          c++;
                                          cntN[6] = c;
                                        }
                                      });
                                      print(cntN[6]);
                                      if (counters.containsKey(sushiList[6])) {
                                        setState(() {
                                          int k = counters[sushiList[6]]!;
                                          k++;
                                          counters[sushiList[6]] = k;
                                        });
                                      } else
                                        counters[sushiList[6]] = 1;
                                      widget.changeBasket(sushiList[6], false);
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
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
                          Container(
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
                                      showAlertDialog(context, sushiList[6],
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
                                            image: AssetImage(sushiList[6].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[6].name,
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
                                  child: Text("Вага: " + sushiList[6].weight),
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
                                        sushiList[6].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[6] != null &&
                                          cntN[6] != 0
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
                                              .containsKey(sushiList[6])) {
                                            setState(() {
                                              int k = counters[sushiList[6]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[6], true);
                                              }
                                              counters[sushiList[6]] = k;
                                            });
                                          } else
                                            counters[sushiList[6]] = 0;

                                          setState(() {
                                            if (cntN[6] != 0 &&
                                                cntN[6] != null) {
                                              int c = cntN[6]!;
                                              c--;
                                              cntN[6] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[6] != null &&
                                          cntN[6] != 0
                                          ? Text(
                                        cntN[6].toString(),
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
                                          print(cntN[6]);
                                          setState(() {
                                            if (cntN[6] == null)
                                              cntN[6] = 1;
                                            else {
                                              int c = cntN[6]!;
                                              c++;
                                              cntN[6] = c;
                                            }
                                          });
                                          print(cntN[6]);
                                          if (counters.containsKey(sushiList[6])) {
                                            setState(() {
                                              int k = counters[sushiList[6]]!;
                                              k++;
                                              counters[sushiList[6]] = k;
                                            });
                                          } else
                                            counters[sushiList[6]] = 1;
                                          widget.changeBasket(sushiList[6], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
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
                                      showAlertDialog(context, sushiList[7],
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
                                            image: AssetImage(sushiList[7].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[7].name,
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
                                  child: Text("Вага: " + sushiList[7].weight),
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
                                        sushiList[7].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[7] != null &&
                                          cntN[7] != 0
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
                                              .containsKey(sushiList[7])) {
                                            setState(() {
                                              int k = counters[sushiList[7]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[7], true);
                                              }
                                              counters[sushiList[7]] = k;
                                            });
                                          } else
                                            counters[sushiList[7]] = 0;

                                          setState(() {
                                            if (cntN[7] != 0 &&
                                                cntN[7] != null) {
                                              int c = cntN[7]!;
                                              c--;
                                              cntN[7] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[7] != null &&
                                          cntN[7] != 0
                                          ? Text(
                                        cntN[7].toString(),
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
                                          print(cntN[7]);
                                          setState(() {
                                            if (cntN[7] == null)
                                              cntN[7] = 1;
                                            else {
                                              int c = cntN[7]!;
                                              c++;
                                              cntN[7] = c;
                                            }
                                          });
                                          print(cntN[7]);
                                          if (counters.containsKey(sushiList[7])) {
                                            setState(() {
                                              int k = counters[sushiList[7]]!;
                                              k++;
                                              counters[sushiList[7]] = k;
                                            });
                                          } else
                                            counters[sushiList[7]] = 1;
                                          widget.changeBasket(sushiList[7], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
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
                                      showAlertDialog(context, sushiList[8],
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
                                            image: AssetImage(sushiList[8].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[8].name,
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
                                  child: Text("Вага: " + sushiList[8].weight),
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
                                        sushiList[8].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[8] != null &&
                                          cntN[8] != 0
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
                                              .containsKey(sushiList[8])) {
                                            setState(() {
                                              int k = counters[sushiList[8]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[8], true);
                                              }
                                              counters[sushiList[8]] = k;
                                            });
                                          } else
                                            counters[sushiList[8]] = 0;

                                          setState(() {
                                            if (cntN[8] != 0 &&
                                                cntN[8] != null) {
                                              int c = cntN[8]!;
                                              c--;
                                              cntN[8] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[8] != null &&
                                          cntN[8] != 0
                                          ? Text(
                                        cntN[8].toString(),
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
                                          print(cntN[8]);
                                          setState(() {
                                            if (cntN[8] == null)
                                              cntN[8] = 1;
                                            else {
                                              int c = cntN[8]!;
                                              c++;
                                              cntN[8] = c;
                                            }
                                          });
                                          print(cntN[8]);
                                          if (counters.containsKey(sushiList[8])) {
                                            setState(() {
                                              int k = counters[sushiList[8]]!;
                                              k++;
                                              counters[sushiList[8]] = k;
                                            });
                                          } else
                                            counters[sushiList[8]] = 1;
                                          widget.changeBasket(sushiList[8], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
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
                                      showAlertDialog(context, sushiList[9],
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
                                            image: AssetImage(sushiList[9].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[9].name,
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
                                  child: Text("Вага: " + sushiList[9].weight),
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
                                        sushiList[9].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[9] != null &&
                                          cntN[9] != 0
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
                                              .containsKey(sushiList[9])) {
                                            setState(() {
                                              int k = counters[sushiList[9]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[9], true);
                                              }
                                              counters[sushiList[9]] = k;
                                            });
                                          } else
                                            counters[sushiList[9]] = 0;

                                          setState(() {
                                            if (cntN[9] != 0 &&
                                                cntN[9] != null) {
                                              int c = cntN[9]!;
                                              c--;
                                              cntN[9] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[9] != null &&
                                          cntN[9] != 0
                                          ? Text(
                                        cntN[9].toString(),
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
                                          print(cntN[9]);
                                          setState(() {
                                            if (cntN[9] == null)
                                              cntN[9] = 1;
                                            else {
                                              int c = cntN[9]!;
                                              c++;
                                              cntN[9] = c;
                                            }
                                          });
                                          print(cntN[9]);
                                          if (counters.containsKey(sushiList[9])) {
                                            setState(() {
                                              int k = counters[sushiList[9]]!;
                                              k++;
                                              counters[sushiList[9]] = k;
                                            });
                                          } else
                                            counters[sushiList[9]] = 1;
                                          widget.changeBasket(sushiList[9], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
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
                                      showAlertDialog(context, sushiList[10],
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
                                            image: AssetImage(sushiList[10].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[10].name,
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
                                  child: Text("Вага: " + sushiList[10].weight),
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
                                        sushiList[10].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[10] != null &&
                                          cntN[10] != 0
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
                                              .containsKey(sushiList[10])) {
                                            setState(() {
                                              int k = counters[sushiList[10]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[10], true);
                                              }
                                              counters[sushiList[10]] = k;
                                            });
                                          } else
                                            counters[sushiList[10]] = 0;

                                          setState(() {
                                            if (cntN[10] != 0 &&
                                                cntN[10] != null) {
                                              int c = cntN[10]!;
                                              c--;
                                              cntN[10] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[10] != null &&
                                          cntN[10] != 0
                                          ? Text(
                                        cntN[10].toString(),
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
                                          print(cntN[10]);
                                          setState(() {
                                            if (cntN[10] == null)
                                              cntN[10] = 1;
                                            else {
                                              int c = cntN[10]!;
                                              c++;
                                              cntN[10] = c;
                                            }
                                          });
                                          print(cntN[10]);
                                          if (counters.containsKey(sushiList[10])) {
                                            setState(() {
                                              int k = counters[sushiList[10]]!;
                                              k++;
                                              counters[sushiList[10]] = k;
                                            });
                                          } else
                                            counters[sushiList[10]] = 1;
                                          widget.changeBasket(sushiList[10], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
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
                                      showAlertDialog(context, sushiList[11],
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
                                            image: AssetImage(sushiList[11].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[11].name,
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
                                  child: Text("Вага: " + sushiList[11].weight),
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
                                        sushiList[11].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[11] != null &&
                                          cntN[11] != 0
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
                                              .containsKey(sushiList[11])) {
                                            setState(() {
                                              int k = counters[sushiList[11]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[11], true);
                                              }
                                              counters[sushiList[11]] = k;
                                            });
                                          } else
                                            counters[sushiList[11]] = 0;

                                          setState(() {
                                            if (cntN[11] != 0 &&
                                                cntN[11] != null) {
                                              int c = cntN[11]!;
                                              c--;
                                              cntN[11] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[11] != null &&
                                          cntN[11] != 0
                                          ? Text(
                                        cntN[11].toString(),
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
                                          print(cntN[11]);
                                          setState(() {
                                            if (cntN[11] == null)
                                              cntN[11] = 1;
                                            else {
                                              int c = cntN[11]!;
                                              c++;
                                              cntN[11] = c;
                                            }
                                          });
                                          print(cntN[11]);
                                          if (counters.containsKey(sushiList[11])) {
                                            setState(() {
                                              int k = counters[sushiList[11]]!;
                                              k++;
                                              counters[sushiList[11]] = k;
                                            });
                                          } else
                                            counters[sushiList[11]] = 1;
                                          widget.changeBasket(sushiList[11], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
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
                                      showAlertDialog(context, sushiList[12],
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
                                            image: AssetImage(sushiList[12].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[12].name,
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
                                  child: Text("Вага: " + sushiList[12].weight),
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
                                        sushiList[12].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[12] != null &&
                                          cntN[12] != 0
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
                                              .containsKey(sushiList[12])) {
                                            setState(() {
                                              int k = counters[sushiList[12]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[12], true);
                                              }
                                              counters[sushiList[12]] = k;
                                            });
                                          } else
                                            counters[sushiList[12]] = 0;

                                          setState(() {
                                            if (cntN[12] != 0 &&
                                                cntN[12] != null) {
                                              int c = cntN[12]!;
                                              c--;
                                              cntN[12] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[12] != null &&
                                          cntN[12] != 0
                                          ? Text(
                                        cntN[12].toString(),
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
                                          print(cntN[12]);
                                          setState(() {
                                            if (cntN[12] == null)
                                              cntN[12] = 1;
                                            else {
                                              int c = cntN[12]!;
                                              c++;
                                              cntN[12] = c;
                                            }
                                          });
                                          print(cntN[12]);
                                          if (counters.containsKey(sushiList[12])) {
                                            setState(() {
                                              int k = counters[sushiList[12]]!;
                                              k++;
                                              counters[sushiList[12]] = k;
                                            });
                                          } else
                                            counters[sushiList[12]] = 1;
                                          widget.changeBasket(sushiList[12], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
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
                                      showAlertDialog(context, sushiList[13],
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
                                            image: AssetImage(sushiList[13].image),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    )),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    sushiList[13].name,
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
                                  child: Text("Вага: " + sushiList[13].weight),
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
                                        sushiList[13].price,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      cntN[13] != null &&
                                          cntN[13] != 0
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
                                              .containsKey(sushiList[13])) {
                                            setState(() {
                                              int k = counters[sushiList[13]]!;
                                              if (k != 0) {
                                                k--;
                                                widget.changeBasketDel(
                                                    sushiList[13], true);
                                              }
                                              counters[sushiList[13]] = k;
                                            });
                                          } else
                                            counters[sushiList[13]] = 0;

                                          setState(() {
                                            if (cntN[13] != 0 &&
                                                cntN[13] != null) {
                                              int c = cntN[13]!;
                                              c--;
                                              cntN[13] = c;
                                            }
                                          });
                                        },
                                        child: Text('-'),
                                      )
                                          : Container(
                                        width: 35,
                                      ),
                                      cntN[13] != null &&
                                          cntN[13] != 0
                                          ? Text(
                                        cntN[13].toString(),
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
                                          print(cntN[13]);
                                          setState(() {
                                            if (cntN[13] == null)
                                              cntN[13] = 1;
                                            else {
                                              int c = cntN[13]!;
                                              c++;
                                              cntN[13] = c;
                                            }
                                          });
                                          print(cntN[13]);
                                          if (counters.containsKey(sushiList[13])) {
                                            setState(() {
                                              int k = counters[sushiList[13]]!;
                                              k++;
                                              counters[sushiList[13]] = k;
                                            });
                                          } else
                                            counters[sushiList[13]] = 1;
                                          widget.changeBasket(sushiList[13], false);
                                        },
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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


