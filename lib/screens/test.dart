import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  Widget childWidget = ChildWidget();

  void changeChildWidget(Widget newWidget) {
    setState(() {
      childWidget = newWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/big_logo.png'),
            fit: BoxFit.fitWidth,
          )),      width: 1000,
      child: SingleChildScrollView(
        child: Column(
          children: [
            childWidget,
            ElevatedButton(
              onPressed: () {
                changeChildWidget(DeliveryInfoWidget());
              },
              child: Text('Изменить виджет'),
            ),
            BottomContactsWidget(
              onChildWidgetChanged: changeChildWidget,
            ),
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Child Widget');
  }
}

class DeliveryInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Delivery Info Widget');
  }
}

class BottomContactsWidget extends StatelessWidget {
  final Function(Widget) onChildWidgetChanged;

  BottomContactsWidget({required this.onChildWidgetChanged});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onChildWidgetChanged(DeliveryInfoWidget());
      },
      child: Text('Изменить виджет'),
    );
  }
}
