import 'package:flutter/material.dart';
import 'package:patungkuy/models/confirmed_order.dart';

class ConfirmedOrderTile extends StatefulWidget {

  final ConfirmedOrder confirmedorder;
  final int index;
  ConfirmedOrderTile({ this.confirmedorder, this.index });

  @override
  _ConfirmedOrderTileState createState() => _ConfirmedOrderTileState();
}

class _ConfirmedOrderTileState extends State<ConfirmedOrderTile> {
  @override
  Widget build(BuildContext context) {
    print((widget.index + 1).toString() + '.  ' + widget.confirmedorder.order.name);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Text((widget.index + 1).toString() + '.  ' + widget.confirmedorder.order.name),
    );
  }
}