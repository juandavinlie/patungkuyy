import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/brew.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              //onTap: () {},
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              title: Text(widget.order.name),
              subtitle: Text('Rp ' + widget.order.price.toString()),
              trailing: RaisedButton.icon(
                  onPressed: counter2 == 0 ? null : () {
                    setState(() {
                      counter2 = 0;
                    });;
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
                //backgroundImage: AssetImage('assets/${order.image}'),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.order.category,
                    textAlign: TextAlign.right,
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
        elevation: 10.0,
      ),
    );
  }
}
