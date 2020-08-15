import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Map data = {};
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String email = data['email'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              radius: 50.0,
            ),
            Divider(
              height: 30.0,
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$email',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rp $balance,00',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                setState(() {
                  balance += 10000;
                });
              },
              label: Text(
                'Top Up',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
