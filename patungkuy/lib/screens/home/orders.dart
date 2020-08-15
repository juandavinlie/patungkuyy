import 'package:flutter/material.dart';
import 'package:patungkuy/screens/home/add_order.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'order_list.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/authenticate/authenticate.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patungkuy/shared/constants.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _addOrderPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: AddOrder(),
            );
          });
    }

    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: OrderList(),
      ),
    );
  }
}
