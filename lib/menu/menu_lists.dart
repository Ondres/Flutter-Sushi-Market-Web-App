import 'package:flutter/material.dart';
import 'package:sushi/menu/SushiClass.dart';

Map<Product, int> counters = {};


List<Product> basket = [
];

String? currentValue =  "Фірмові роли*assets/SignatureSushi.png";
final List<String> menu_items = [
  "Фірмові роли*assets/SignatureSushi.png",
  "Набори*assets/SushiPhiladelphia.png",
  "Великі роли*assets/ClassicSushi.png",
  "Роли в норі*assets/SushiMaki.png",
  "Суші та гункани*assets/Sushi.png"
];

List<String> chapters = [
  "Набори",
  "Фірмові роли",
  "Великі роли",
  "Роли в норі",
  "Суші та гункани"
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
    image: 'assets/menu/Blu-fіn.jpg',
    weight: '340 г',
    description:
    'Лосось, Тунець, Креветка, Огірок, Масаго, Соус унагі, Вершковий сир',
    name: 'Блу-фін',
    price: '350₴',
  ),
  Product(
    image: 'assets/menu/Alyaska.jpg',
    weight: '250 г',
    description:
    'Лосось, вугор, Вершковий сир, Авокадо, Огірок, Фисташка, Унагі соус',
    name: 'Аляска - нету',
    price: '230₴',
  ),
  Product(
    image: 'assets/menu/Lanch rol.jpg',
    weight: '340 г',
    description:
    'Лосось, Вершковий сир, Масаго, Огірок, Соус унагі, Чеддер, Мигдаль',
    name: 'Ланч-рол',
    price: '300₴',
  ),
  Product(
    image: 'assets/menu/Іmperator.jpg',
    weight: '300 г',
    description: 'Лосось, Огірок, Тунець, Масаго, Креветки',
    name: 'Імператор',
    price: '300₴',
  ),
  Product(
    image: 'assets/menu/Pekіn.jpg',
    weight: '295 г',
    description: 'Вершковий сир, Вугор, Персик, Соус унагі, Фісташки',
    name: 'Пекін',
    price: '270₴',
  ),
  Product(
    image: 'assets/menu/CHorna perlina.jpg',
    weight: '300 г',
    description:
    'Огірок, Вершковий сир, Чеддер, Соус унагі, Лосось, Соус солодкий чілі',
    name: 'Чорна перлина',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Ebі-rol.jpg',
    weight: '295 г',
    description:
    'Креветка, Масаго, Чеддер, Вершковий сир, Авокадо, Соус унагі, Пармезан, Соус солодкий чілі',
    name: 'Ебі-рол',
    price: '250₴',
  ),
];

List<Product> philadelphia = [
  Product(
    image: 'assets/menu/Fіladelfіya klasichna.jpg',
    weight: '300 г',
    description: 'Лосось, Огірок, Вершковий сир',
    name: 'Філадельфія класична',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Fіladelfіya lyuks.jpg',
    weight: '330 г',
    description: 'Вершковий сир, Авокадо, Лосось, Червона ікра, Томго',
    name: 'Філадельфія люкс',
    price: '300₴',
  ),
  Product(
    image: 'assets/menu/Fіladelfіya mіks.jpg',
    weight: '305 г',
    description: 'Лосось, Вугор, Огірок, Соус унагі, Кунжут, Вершковий сир',
    name: 'Філадельфія мікс',
    price: '260₴',
  ),
  Product(
    image: 'assets/menu/Fіladelfіya v kunzhutі.jpg',
    weight: '275 г',
    description: 'Кунжут, Огірок, Лосось, Вершковий сир',
    name: 'Філадельфія в кунжуті',
    price: '200₴',
  ),
  Product(
    image: 'assets/menu/Fіladelfіya z krevetkoyu.jpg',
    weight: '315 г',
    description: 'Авокадо, Вершковий сир, Креветка, Масаго, Соус солодкий чилі',
    name: 'Філадельфія з креветкою',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Fіladelfіya z vugrem.jpg',
    weight: '290 г',
    description: 'Вершковий сир, Вугор, Соус унагі, Фісташки, Огірок',
    name: 'Філадельфія з вугрем',
    price: '270₴',
  ),
];

List<Product> classic = [
  Product(
    image: 'assets/menu/332A6450.jpg',
    weight: '335 г',
    description:
    'Авокадо, Лосось, Вугор, Соус унагі, Вершковий сир, Фісташки, Огірок',
    name: 'Канада',
    price: '360₴',
  ),


  Product(
    image: 'assets/menu/Bonіto.jpg',
    weight: '255 г',
    description:
    'Листя салату, Огірок, Масаго, Лосось смажений, Стружка тунця, Вершковий сир',
    name: 'Боніто',
    price: '195₴',
  ),
  Product(
    image: 'assets/menu/Bіlij drakon.jpg',
    weight: '300 г',
    description: 'Огірок, Чеддер, Сніговий краб, Соус унагі, Тунець',
    name: 'Білий дракон',
    price: '270₴',
  ),
  Product(
    image: 'assets/menu/CHervonij drakon.jpg',
    weight: '340 г',
    description: 'Огірок, Вугор, Масаго, Вершковий сир, Червона ікра, Лосось',
    name: 'Червоний дракон',
    price: '420₴',
  ),
  Product(
    image: 'assets/menu/CHornij drakon.jpg',
    weight: '330 г',
    description:
    'Вершковий сир, Томго, Креветка, Огірок, Фісташки, Вугор, Соус унагі',
    name: 'Чорний дракон',
    price: '380₴',
  ),
  Product(
    image: 'assets/menu/CHorna mamba.jpg',
    weight: '270 г',
    description: 'Огірок, Тунець, Вершковий сир, Масаго',
    name: 'Чорна мамба',
    price: '270₴',
  ),


  Product(
    image: 'assets/menu/Kalіfornіya z krevetkoyu ta krabom.jpg',
    weight: '280 г',
    description: 'Огірок, Авокадо, Сніговий краб, Масаго, Майонез, Креветка',
    name: 'Каліфорнія з крабом та криветкою',
    price: '200₴',
  ),
  Product(
    image: 'assets/menu/Kalіfornіya z lososem.jpg',
    weight: '270 г',
    description: 'Лосось, Огірок, Авокадо, Масаго, Майонез',
    name: 'Каліфорнія з лососем',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Kalіfornіya z tuntsem.jpg',
    weight: '270 г',
    description: 'Огарок, Авокадо, Масаго, Тунець',
    name: 'Каліфорная з тунцем',
    price: '270₴',
  ),
  Product(
    image: 'assets/menu/Kalіfornіya z vugrem.jpg',
    weight: '290 г',
    description: 'Огірок, Авокадо, Майонез, Вугор, Соус унагі, Кунжут',
    name: 'Каліфорнія з вугрем',
    price: '290₴',
  ),


  Product(
    image: 'assets/menu/Futomakі z grebіntsem.jpg',
    weight: '295 г',
    description:
    'Листя салату, Огірок, Авокадо, Кімчі, Майонез, Гребінець, Масаго',
    name: 'Футомакі з гребінцем',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Futomakі z lososem.jpg',
    weight: '295 г',
    description:
    'Листя салату, Огірок, Авокадо, Кімчі, Майонез, Масаго, Лосось',
    name: 'Футомакі з лососем',
    price: '270₴',
  ),
  Product(
    image: 'assets/menu/Futomakі z tuntsem.jpg',
    weight: '295 г',
    description:
    'Листя салату, Огірок, Авокадо, Кімчі, Майонез, Масаго, Тунець',
    name: 'Футомакі з тунцем',
    price: '280₴',
  ),
  Product(
    image: 'assets/menu/Osaka.jpg',
    weight: '275 г',
    description:
    'Огірок, Майонез, Кунжут, Лосось смажений, Вершковий сир, Листя салату',
    name: 'Осака',
    price: '180₴',
  ),
];


List<Product> maki = [
  Product(
    image: 'assets/menu/Makі z avokado.jpg',
    weight: '200 г',
    description: 'Авокадо, Соус унагі',
    name: 'Макі з авокадо - нету',
    price: '200₴',
  ),
  Product(
    image: 'assets/menu/Makі z lososem.jpg',
    weight: '140 г',
    description: 'Рис, Лосось',
    name: 'Макі з лососем',
    price: '160₴',
  ),
  Product(
    image: 'assets/menu/Makі z ogіrkom.jpg',
    weight: '140 г',
    description: 'Рис, Огірок, Кунжут',
    name: 'Макі з огірком',
    price: '140₴',
  ),
  Product(
    image: 'assets/menu/Makі z tuntsem.jpg',
    weight: '140 г',
    description: 'Рис, Тунець',
    name: 'Макі з тунцем',
    price: '180₴',
  ),
  Product(
    image: ' assets/menu/Makі z vugrem.jpg',
    weight: '160 г',
    description: 'Вугор, Соус унагі, Кунжут',
    name: 'Макі з вугрем',
    price: '200₴',
  ),
  Product(
    image: 'assets/menu/Fyudzhi.jpg',
    weight: '275 г',
    description:
    'Огірок, Вугор, Масаго, Вершковий сир, Соус унагі, Томго, Кунжут',
    name: 'Фьюджи',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Raj-taj.jpg',
    weight: '265 г',
    description: 'Авокадо, Огірок, Майонез, Лосось, Креветка',
    name: 'Рай-тай',
    price: '190₴',
  ),
];


List<Product> sushi = [
  Product(
    image: 'assets/menu/Gunkan z grebіntsem.jpg',
    weight: '140 г',
    description: 'Соус спайсі, Масаго, Гребінець',
    name: 'Гункан з гребінцем',
    price: '240₴',
  ),
  Product(
    image: 'assets/menu/Gunkan z lososem.jpg',
    weight: '250 г',
    description: 'Соус спайсі, Масаго, Лосось',
    name: 'Гункан з лососем - нету',
    price: '230₴',
  ),
  Product(
    image: 'assets/menu/Gunkan z tuntsem.jpg',
    weight: '140 г',
    description: 'Соус спайсі, Масаго, Тунець',
    name: 'Гункан з тунцем',
    price: '230₴',
  ),
  Product(
    image: 'assets/menu/Gunkan z vugrem.jpg',
    weight: '140 г',
    description: 'Вугор, Соус унагі, Масаго',
    name: 'Гункан з вугрем',
    price: '250₴',
  ),
  Product(
    image: 'assets/menu/Sushі z lososem.jpg',
    weight: '180 г',
    description: 'Лосось, Рис',
    name: 'Суші з лососем - нету',
    price: '180₴',
  ),
  Product(
    image: 'assets/menu/Sushі z vugrem.jpg',
    weight: '180 г',
    description: 'Вугор, Соус унагі, Кунжут',
    name: 'Суші з вугрем - нету',
    price: '180₴',
  ),
  Product(
    image: 'assets/menu/Vegan.jpg',
    weight: '180 г',
    description: 'Огірок, Салат чука, Листя салату, Авокадо',
    name: 'Вегана - нету',
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