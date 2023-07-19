import 'package:flutter/material.dart';
import 'package:sushi/screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Установите значение false
      initialRoute: 'main_page',
      routes: {
        'main_page': (context) => MainPage(),
      },
    );
  }
}
