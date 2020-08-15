import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/temp_order.dart';

class TempOrderTile extends StatefulWidget {
  final TempOrder tempOrder;
  TempOrderTile({this.tempOrder});

  @override
  _TempOrderTileState createState() => _TempOrderTileState();
}

class _TempOrderTileState extends State<TempOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.tempOrder.order.name,
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "Qty: ${widget.tempOrder.tempQuantity}",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Text(
                "Rp ${widget.tempOrder.order.price * widget.tempOrder.tempQuantity}",
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
                        widget.tempOrder.tempQuantity = 0;
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
