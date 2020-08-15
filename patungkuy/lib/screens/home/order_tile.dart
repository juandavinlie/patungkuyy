import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/user.dart';
import 'package:patungkuy/services/database.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  OrderTile({this.order});

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  int counter = 0;
  int counter2 = 0;

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              //onTap: () {},
              contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 0),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 0, 0),
                child: Text(
                  widget.order.name,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 5.0, 10, 0),
                child: Text(
                  'Rp ' + widget.order.price.toString(),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: RaisedButton.icon(
                  onPressed: counter2 == 0 || counter == 0 ? null : () {
                    setState(() {
                      counter2 = 0;
                      DatabaseService(uid: user.uid).updateTempOrderData(widget.order.name, widget.order.price, widget.order.quantity, widget.order.category, counter);
                    });
                  },
                  icon: Icon(Icons.check_box),
                  label: Text(
                    'CONFIRM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  splashColor: Colors.green,
                  color: Colors.blue[100]),
              leading: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/${widget.order.name}.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                SizedBox(width: 16.0),
                Text('Total Confirmed Order : '),
                Text(
                  widget.order.quantity.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 16),
                Text('Discount                         : '),
                Text(
                  "12%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 10.0),
                  child: Card(
                    elevation: 0,
                    color: Colors.amber[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.order.category,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter += 1;
                      counter2 += 1;
                    });
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text('Qty: $counter'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) {
                        counter -= 1;
                        counter2 -= 1;
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
          ],
        ),
        elevation: 2.0,
      ),
    );
  }
}
