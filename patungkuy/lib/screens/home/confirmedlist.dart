import 'package:flutter/material.dart';
import 'package:patungkuy/models/confirmed_order.dart';
import 'package:patungkuy/screens/home/confirmedtile.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/shared/constants.dart';

class ConfirmedOrderList extends StatefulWidget {
  @override
  _ConfirmedOrderListState createState() => _ConfirmedOrderListState();
}

class _ConfirmedOrderListState extends State<ConfirmedOrderList> {
  @override
  Widget build(BuildContext context) {
    final confirmedorders = Provider.of<List<ConfirmedOrder>>(context) ?? [];
    //int totalPrice = 0;
    //(confirmedorders[index].order.price * confirmedorders[index].tempQuantity);
    int discount = 0;
    //discount += widget.tempOrder.order.price * (widget.tempOrder.tempQuantity / 10).toInt();

    return ListView.builder(
      itemCount: confirmedorders.length,
      itemBuilder: (context, index) {
        totalPrice += (confirmedorders[index].order.price *
            confirmedorders[index].tempQuantity);
        discount += confirmedorders[index].order.price *
            (confirmedorders[index].tempQuantity ~/ 10).toInt();
        print(totalPrice);
        print(discount);
        return ConfirmedOrderTile(
            confirmedorder: confirmedorders[index], index: index);
      },
    );
  }
}
