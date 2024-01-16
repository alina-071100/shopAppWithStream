import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String id;
  final String name;
  final int price;
  final int count;
  final String imageUrl;
  final void Function() onPress;
  const Item(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.count,
      required this.onPress,
      required this.imageUrl});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:const Color.fromARGB(255, 208, 208, 210),
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(widget.imageUrl))),
              ),
             const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${widget.price}\$",
                    style:const  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        // IconButton(
                        //   onPressed: widget.onPress, icon: Icon(Icons)),
                      Text("${widget.count}"),
                      IconButton(
                          onPressed: widget.onPress, icon: const Icon(Icons.add))
                    ],
                  ),
                  // IconButton(onPressed: widget.onPress, icon: Icon(Icons.add))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
