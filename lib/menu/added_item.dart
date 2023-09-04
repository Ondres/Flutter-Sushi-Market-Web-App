import 'package:flutter/material.dart';
import 'package:sushi/menu/menu_lists.dart';
import 'package:sushi/screens/main_page.dart';
import 'SushiClass.dart';

class AddedSushiItem extends StatefulWidget {
  final Product product;
  final Map<Product, int> counters;
  final Function(Product, bool, {int? items}) changeBasket;
  final Function(Product, bool) changeBasketAdd;
  final bool empty;

  AddedSushiItem({
    required this.product,
    required this.counters,
    required this.changeBasket,
    required this.changeBasketAdd,
    this.empty = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AddedSushiItem> createState() => _AddedSushiItemState();
}

class _AddedSushiItemState extends State<AddedSushiItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.counters[widget.product] !=
        null) if (widget.counters[widget.product]! > 0)
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: 240,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromRGBO(242, 242, 242, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 90,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular((10))),
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 120,
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 30,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.zero),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          int k =
                                              widget.counters[widget.product]!;
                                          k--;
                                          widget.counters[widget.product] = k;
                                        });
                                        if (widget.counters[widget.product] ==
                                            0) {
                                          widget.changeBasket(
                                              widget.product, false,
                                              items: 1);
                                        } else
                                          widget.changeBasket(
                                              widget.product, true);
                                        if (widget.empty && basket.isEmpty)
                                          Navigator.of(context).pop();
                                      },
                                      child: Container(
                                          width: 30,
                                          alignment: Alignment.center,
                                          child: Icon(Icons.dangerous,
                                              size: 24,
                                              color: Colors.black54)))),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text(
                                  widget.counters[widget.product].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                  width: 30,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.zero),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          int k =
                                              widget.counters[widget.product]!;
                                          k++;
                                          widget.counters[widget.product] = k;
                                        });
                                        widget.changeBasketAdd(
                                            widget.product, true);
                                      },
                                      child: Container(
                                          width: 30,
                                          alignment: Alignment.center,
                                          child: Icon(Icons.add_circle,
                                              size: 24,
                                              color: Color.fromRGBO(
                                                  255, 141, 64, 1))))),
                            ],
                          ))),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    width: 120,
                    child: Text(
                      widget.product.price,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 20,
                child: TextButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    widget.changeBasket(widget.product, false,
                        items: widget.counters[widget.product]);
                    setState(() {
                      counters.remove(widget.product);
                    });
                    if (widget.empty && basket.isEmpty)
                      Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.black54,
                  ),
                )),
          ],
        ),
      );
    return Container();
  }
}



