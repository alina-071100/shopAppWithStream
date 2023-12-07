import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop/cart_page.dart';
import 'package:flutter_shop/product_list.dart';
import 'package:flutter_shop/product_item.dart';
import 'package:flutter_shop/product_model.dart';

class ProductList extends StatefulWidget {
  final StreamController<int> cartStreamController;

  ProductList({Key? key, required this.cartStreamController}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // List<int> productQuantities = List.filled(productName.length, 0);
  StreamController<int> controllerStream = StreamController.broadcast();

  StreamController<Map<String,dynamic>> testStream = StreamController.broadcast();

  List<Model> test = [];

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 121, 121),
        title: const Text(
          "Shop Page",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(
                            // cartStreamController: testStream,
                          ))),
            ),
          ),
          StreamBuilder<int>(
              stream: controllerStream.stream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  count += snapshot.data ?? 0;
                }
                return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text("$count"));
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  Model model = Model(
                      id: product[index]['id'],
                      name: product[index]['name'],
                      price: product[index]['price'],
                      count: product[index]['count'],
                      imageUrl: product[index]['image_url']);
                  return SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Item(
                          id: model.id,
                          name: model.name,
                          price: model.price,
                          count: model.count,
                          onPress: () {
                       
                            testStream.add(product[index]);
                          },
                          imageUrl: model.imageUrl),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// class CartPage extends StatelessWidget {
//   StreamController<Map<String,dynamic>>? cartStreamController;

//   CartPage({Key? key, this.cartStreamController}) : super(key: key);

//   int totalQuantity = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<Map<String,dynamic>>(
//           stream: cartStreamController?.stream,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//                 Model model = Model(
//                       id: product[index]['id'],
//                       name: product[index]['name'],
//                       price: product[index]['price'],
//                       count: product[index]['count'],
//                       imageUrl: product[index]['image_url']);
//               model = snapshot.data ?? [];
//               return Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: model.length,
//                         itemBuilder: (context, index) {
//                           return SizedBox(
//                             height: 150,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: Item(
//                                   id: model[index].id,
//                                   name: model[index].name,
//                                   price: model[index].price,
//                                   count: model[index].count,
//                                   onPress: () {
//                                     // CartPage.cartStreamController.add(model);
//                                   },
//                                   imageUrl: model[index].imageUrl),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               );
//             } else {
//               return Text('sdfs');
//             }
//           }),
//     );
//   }
// }
