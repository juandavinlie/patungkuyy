import 'package:flutter/material.dart';
import 'package:patungkuy/main.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Drawer(
              child: Icon(Icons.menu),
            ),
            title: Text(
              'Name',
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(content: Text('tap'));
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      Icons.search,
                      size: 26.0,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.more_vert),
                  )),
            ]),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.ac_unit),
                  label: Text('Orders'),
                ),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.account_balance),
                    label: Text('My Cart')),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.account_balance),
                    label: Text('Confirmed')),
              ],
            )
          ],
        ));
  }
}
