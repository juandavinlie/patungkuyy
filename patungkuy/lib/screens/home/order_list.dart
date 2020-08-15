import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/models/order.dart';
import 'order_tile.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    //this is a stream
    //everytime there is a change, a whole set of data (including the changes and non-changes get released as 'brews')
    final orders = Provider.of<List<Order>>(context) ?? [];

    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderTile(order: orders[index]);
        });
  }
}
