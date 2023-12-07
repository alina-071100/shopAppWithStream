import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StreamController<int> cartStreamController =
      StreamController<int>.broadcast();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowMaterialGrid: false,
        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: ProductList(cartStreamController: cartStreamController),
       );
  }
}
