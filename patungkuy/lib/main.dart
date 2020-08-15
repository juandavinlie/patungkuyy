import 'package:flutter/material.dart';
import 'package:patungkuy/screens/home/account.dart';
import 'package:patungkuy/screens/home/confirmed.dart';
import 'screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'services/auth.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/mycart.dart';
import 'package:patungkuy/screens/home/account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/mycart': (context) => MyCart(),
          '/orders': (context) => Orders(),
          '/confirmed': (context) => Confirmed(),
          '/account': (context) => Account(),
        },
      ),
    );
  }
}
