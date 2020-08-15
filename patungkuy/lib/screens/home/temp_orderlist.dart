import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temp_ordertile.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'temp_ordertile_stopper.dart';

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
          return tempOrders[0].order.name == 'AA' ? TempOrderTileStopper(tempOrder: tempOrders[index]) : TempOrderTile(tempOrder: tempOrders[index]);
        });

  }
}