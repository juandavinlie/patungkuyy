import 'package:flutter/material.dart';
import 'package:patungkuy/models/cart_item.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/screens/home/add_order.dart';

class MyCart extends StatefulWidget {
  List<TempOrder> listOfTempOrders;
  MyCart({this.listOfTempOrders});
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem> titles = [
    CartItem(item: 'chicken', quantity: 10, price: 100000),
    CartItem(item: 'cocaine', quantity: 10, price: 1000000),
    CartItem(item: 'meth', quantity: 10, price: 2000000),
  ];

  @override
  void _addOrderPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: AddOrder(),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  title: Text(titles[index].item),
                ),
              ),
            );
          }),
    );
  }
}
