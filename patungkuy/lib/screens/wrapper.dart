import 'package:flutter/material.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/home.dart';
import 'authenticate/authenticate.dart';
import 'package:patungkuy/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate widget
    return user != null ? Home() : Authenticate();
  }
}
