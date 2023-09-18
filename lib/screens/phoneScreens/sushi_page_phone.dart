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
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 160,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: [
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          height: 50,
                          child: Text(
                            sushiList[0].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              showAlertDialog(
                                  context, sushiList[0], widget.changeBasket);
                            },
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(sushiList[0].image),
                                fit: BoxFit.fitWidth,
                              )),
                            )),
                      ])),
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          sushiList[0].description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          "Вага: " + sushiList[0].weight,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        color: Colors.black,
                      ),
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              sushiList[0].price,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            cntN[0] != null && cntN[0] != 0
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
                                      if (counters.containsKey(sushiList[0])) {
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
                                        if (cntN[0] != 0 && cntN[0] != null) {
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
                            cntN[0] != null && cntN[0] != 0
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
                  )),
            ],
          )),
      Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 160,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: [
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          height: 50,
                          child: Text(
                            sushiList[1].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              showAlertDialog(
                                  context, sushiList[1], widget.changeBasket);
                            },
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(sushiList[1].image),
                                fit: BoxFit.fitWidth,
                              )),
                            )),
                      ])),
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          sushiList[1].description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          "Вага: " + sushiList[1].weight,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        color: Colors.black,
                      ),
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              sushiList[1].price,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            cntN[1] != null && cntN[1] != 0
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
                                      if (counters.containsKey(sushiList[1])) {
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
                                        if (cntN[1] != 0 && cntN[1] != null) {
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
                            cntN[1] != null && cntN[1] != 0
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
                  )),
            ],
          )),
      Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 160,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: [
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          height: 50,
                          child: Text(
                            sushiList[2].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              showAlertDialog(
                                  context, sushiList[2], widget.changeBasket);
                            },
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(sushiList[2].image),
                                fit: BoxFit.fitWidth,
                              )),
                            )),
                      ])),
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          sushiList[2].description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          "Вага: " + sushiList[2].weight,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        color: Colors.black,
                      ),
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              sushiList[2].price,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            cntN[2] != null && cntN[2] != 0
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
                                      if (counters.containsKey(sushiList[2])) {
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
                                        if (cntN[2] != 0 && cntN[2] != null) {
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
                            cntN[2] != null && cntN[2] != 0
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
                  )),
            ],
          )),
      sushiList.length > 3
          ? Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                              height: 50,
                              child: Text(
                                sushiList[3].name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  showAlertDialog(context, sushiList[3],
                                      widget.changeBasket);
                                },
                                child: Container(
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(sushiList[3].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                                )),
                          ])),
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              sushiList[3].description,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            height: 15,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Вага: " + sushiList[3].weight,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            height: 35,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  sushiList[3].price,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                cntN[3] != null && cntN[3] != 0
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                          primary:
                                              Color.fromRGBO(27, 57, 119, 1),
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                cntN[3] != null && cntN[3] != 0
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
                      )),
                ],
              ))
          : Container(),
      sushiList.length > 4
          ? Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                              height: 50,
                              child: Text(
                                sushiList[4].name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  showAlertDialog(context, sushiList[4],
                                      widget.changeBasket);
                                },
                                child: Container(
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(sushiList[4].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                                )),
                          ])),
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              sushiList[4].description,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            height: 15,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Вага: " + sushiList[4].weight,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            height: 35,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  sushiList[4].price,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                cntN[4] != null && cntN[4] != 0
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                          primary:
                                              Color.fromRGBO(27, 57, 119, 1),
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                cntN[4] != null && cntN[4] != 0
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
                      )),
                ],
              ))
          : Container(),
      sushiList.length > 5
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                              height: 50,
                              child: Text(
                                sushiList[5].name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  showAlertDialog(context, sushiList[5],
                                      widget.changeBasket);
                                },
                                child: Container(
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(sushiList[5].image),
                                    fit: BoxFit.fitWidth,
                                  )),
                                )),
                          ])),
                  Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              sushiList[5].description,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            height: 15,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Вага: " + sushiList[5].weight,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            height: 35,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  sushiList[5].price,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                cntN[5] != null && cntN[5] != 0
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                          primary:
                                              Color.fromRGBO(27, 57, 119, 1),
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                cntN[5] != null && cntN[5] != 0
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
                      )),
                ],
              ))
          : Container(),
    ]);
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
