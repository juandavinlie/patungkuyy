import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patungkuy/screens/wrapper.dart';

class DrawerCustom extends StatefulWidget {
  final String email;
  DrawerCustom({this.email});

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  // FirebaseAuth fu = FirebaseAuth.instance;
  //   String email2 = 'hello';

  //   void inputData() async {
  //     final FirebaseUser user = await fu.currentUser();
  //     final uid = user.email;
  //     // here you write the codes to input the data into firestore
  //     email2 = uid;
  //   }

  // @override
  // void initState() {
  //   inputData();
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    //inputData();
    print("Hello worlds");
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Hello,'),
          accountEmail: Text(widget.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/Avatar.jpg'),
          ),
          onDetailsPressed: () {
            print(widget.email);
            Navigator.pushNamed(context, '/account',
                arguments: {'email': widget.email});
          },
        ),
        ListTile(
          title: Text('Log out'),
          trailing: Icon(Icons.power_settings_new),
          onTap: () async {
            await AuthService().signOut();
          },
          // Update the state of the app.
          // ...
        ),
      ]),
    );
  }
}
