import 'package:flutter/material.dart';
import 'package:sushi/menu/SushiClass.dart';

Map<Product, int> counters = {};


List<Product> basket = [
];

String? currentValue =  "Фірмові роли*assets/SignatureSushi.png";
final List<String> menu_items = [
  "Фірмові роли*assets/SignatureSushi.png",
  "Філадельфія*assets/SushiPhiladelphia.png",
  "Класичні роли*assets/ClassicSushi.png",
  "Макі*assets/SushiMaki.png",
  "Суші*assets/Sushi.png"
];

List<String> chapters = [
  "Фірмові роли",
  "Філадельфія",
  "Класичні роли",
  "Макі",
  "Суші"
];

List<String> images = [
  "assets/SignatureSushi.png",
  "assets/SushiPhiladelphia.png",
  "assets/ClassicSushi.png",
  "assets/SushiMaki.png",
  "assets/Sushi.png",
];

Product pr =   Product(
  image: 'assets/sushi1.png',
  weight: '300 г',
  description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
  name: 'Червоний дракон',
  price: '270₴',
);

List<Product> firmovi = [
  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi1.png',
    weight: '180 г',
    description: 'Філадельфія, Лосось, сир, огірок, спайси соус',
    name: 'Філадельфія',
    price: '180₴',
  ),
];

List<Product> philadelphia = [
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi1.png',
    weight: '180 г',
    description: 'Філадельфія, Лосось, сир, огірок, спайси соус',
    name: 'Філадельфія',
    price: '180₴',
  ),
  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
];

List<Product> classic = [
  Product(
    image: 'assets/sushi2.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
];


List<Product> maki = [
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
];


List<Product> sushi = [
  Product(
    image: 'assets/sushi3.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi1.png',
    weight: '180 г',
    description: 'Філадельфія, Лосось, сир, огірок, спайси соус',
    name: 'Філадельфія',
    price: '180₴',
  ),
];



List<Product> firmovi_roll = [
  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),

  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),

  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),

  Product(
    image: 'assets/sushi1.png',
    weight: '300 г',
    description: 'Червоний дракон, Лосось, вугор, крем-сир, масаго, огірок, червона ікра, спайси соус',
    name: 'Червоний дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/sushi2.png',
    weight: '250 г',
    description: 'Синій дракон, Лосось, авокадо, креветка, спайси соус',
    name: 'Синій дракон',
    price: '230₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),
  Product(
    image: 'assets/sushi3.png',
    weight: '200 г',
    description: 'Зелений дракон, Лосось, огірок, авокадо, зелена ікра, масаго',
    name: 'Зелений дракон',
    price: '200₴',
  ),


];