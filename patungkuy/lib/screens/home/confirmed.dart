import 'package:flutter/material.dart';
import 'package:patungkuy/services/database.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/screens/home/add_order.dart';
import 'package:patungkuy/models/confirmed_order.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/models/user.dart';
import 'confirmedlist.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  List<String> myCart = [
    'Egg',
    'Chicken',
    'Plastic',
    'Container',
    'Container1',
    'Container2',
    'Container3',
    'Contaier4',
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

  var titles = ['chicken', 'sapi', 'plastic', 'juan'];

  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamProvider<List<ConfirmedOrder>>.value(
        value: DatabaseService(uid: user.uid).confirmedOrders,
        child: Scaffold(
        backgroundColor: Colors.blue[100],
        drawer: DrawerCustom(email: userEmail),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/patungkuy.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              //color: Colors.blue,
              child: Container(
                color: Colors.blue[200],
                padding: EdgeInsets.all(5),
                child: Text('YOUR RECEIPT'),
              ),
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(25.0),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0),
                child: Card(
                  child: ConfirmedOrderList()
                ),
              ),
            ),
            Expanded(flex: 2, child: Text('THE TOTAL')),
            SizedBox(
              width: 152.0,
              child: RaisedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Pay Now?'),
                      content: Text(
                          'If you press "yes", your balance will be deducted and you can no longer cancel your order.'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            for (String s in confirmedProducts) {
                              DatabaseService(uid: user.uid).deleteDataFromConfirmed(s);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
                icon: Icon(Icons.payment),
                label: Text(
                  'PAY NOW',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Are You Sure?'),
                      content: Text(
                          'If you press "yes", all orders will be moved back to your cart.'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            for (String s in confirmedProducts) {
                              DatabaseService(uid: user.uid).deleteDataFromConfirmed(s);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
                icon: Icon(Icons.cancel),
                label: Text(
                  'CANCEL ALL',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
