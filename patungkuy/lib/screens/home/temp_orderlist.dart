import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temp_ordertile.dart';
import 'package:patungkuy/models/temp_order.dart';

class TempOrderList extends StatefulWidget {
  @override
  _TempOrderListState createState() => _TempOrderListState();
}

class _TempOrderListState extends State<TempOrderList> {
  @override
  Widget build(BuildContext context) {
    final tempOrders = Provider.of<List<TempOrder>>(context) ?? [];

    return ListView.builder(
        itemCount: tempOrders.length,
        itemBuilder: (context, index) {
          return TempOrderTile(tempOrder: tempOrders[index]);
        });

  }
}