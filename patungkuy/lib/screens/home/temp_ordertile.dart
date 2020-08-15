import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/models/user.dart';

class TempOrderTile extends StatefulWidget {
  final TempOrder tempOrder;
  TempOrderTile({this.tempOrder});

  @override
  _TempOrderTileState createState() => _TempOrderTileState();
}

class _TempOrderTileState extends State<TempOrderTile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    int totalPrice =
        (widget.tempOrder.order.price * widget.tempOrder.tempQuantity);
    int discount = 0;
    discount += widget.tempOrder.order.price *
        (widget.tempOrder.tempQuantity / 10).toInt();

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(14, 10, 10, 0),
              title: Text(
                widget.tempOrder.order.name,
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total confirmed orders: ${widget.tempOrder.order.quantity}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Target: 1000",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              trailing: Text(
                "Rp ${totalPrice - discount}",
                style: TextStyle(fontSize: 22),
              ),
              // child: Row(
              //   children: [
              //     Text(
              //       titles[index].item,
              //       style: TextStyle(fontSize: 27),
              //     ),
              //     Text(
              //       "Qty: ${titles[index].quantity}",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "Rp ${titles[index].price}",
              //       style: TextStyle(fontSize: 24),
              //     ),
              //   ],
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Text('You saved: ${discount}',
                  style: TextStyle(
                    color: Colors.green,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.tempOrder.tempQuantity += 1;
                    });
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text('Qty: ${widget.tempOrder.tempQuantity}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.tempOrder.tempQuantity > 0) {
                        widget.tempOrder.tempQuantity -= 1;
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                Spacer(),
                FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        DatabaseService(uid: user.uid)
                            .deleteData(widget.tempOrder.order.name);
                      });
                    },
                    icon: Icon(Icons.delete),
                    label: Text('delete')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
