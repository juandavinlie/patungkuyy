import 'package:flutter/material.dart';
import 'package:patungkuy/models/confirmed_order.dart';
import 'package:patungkuy/screens/home/confirmedtile.dart';
import 'package:provider/provider.dart';

class ConfirmedOrderList extends StatefulWidget {
  @override
  _ConfirmedOrderListState createState() => _ConfirmedOrderListState();
}

class _ConfirmedOrderListState extends State<ConfirmedOrderList> {

  @override
  Widget build(BuildContext context) {
    final confirmedorders = Provider.of<List<ConfirmedOrder>>(context) ?? [];

    return ListView.builder(
        itemCount: confirmedorders.length,
        itemBuilder: (context, index) {
        return ConfirmedOrderTile(confirmedorder: confirmedorders[index], index: index);
        },
      );
  }
}