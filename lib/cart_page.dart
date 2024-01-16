import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop/product_item.dart';
import 'package:flutter_shop/product_model.dart';

class CartPage extends StatefulWidget {
  StreamController<List<Model>>? cartStreamController;

  CartPage({Key? key, this.cartStreamController}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalQuantity = 0;
  List<Model> model = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Model>>(
          stream: widget.cartStreamController?.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              model = snapshot.data ?? [];
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Item(
                                  id: model[index].id,
                                  name: model[index].name,
                                  price: model[index].price,
                                  count: model[index].count,
                                  onPress: () {
                                    // CartPage.cartStreamController.add(model);
                                  },
                                  imageUrl: model[index].imageUrl),
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Text('');
            }
          }),
    );
  }
}
