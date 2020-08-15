import 'package:flutter/material.dart';
import 'package:patungkuy/models/confirmed_order.dart';

class ConfirmedOrderTile extends StatefulWidget {
  final ConfirmedOrder confirmedorder;
  final int index;
  ConfirmedOrderTile({this.confirmedorder, this.index});

  @override
  _ConfirmedOrderTileState createState() => _ConfirmedOrderTileState();
}

class _ConfirmedOrderTileState extends State<ConfirmedOrderTile> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
      child: Row(
        children: [
          Text((widget.index + 1).toString() +
              '.  ' +
              widget.confirmedorder.order.name),
          Spacer(),
          Text((widget.confirmedorder.tempQuantity).toString() + '      x    '),
          Text((widget.confirmedorder.order.price).toString() + '    = '),
          Text((widget.confirmedorder.tempQuantity *
                  widget.confirmedorder.order.price)
              .toString()),
        ],
      ),
    );
  }
}
