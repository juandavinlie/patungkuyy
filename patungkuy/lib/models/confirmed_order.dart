import 'package:flutter/material.dart';
import 'order.dart';


class ConfirmedOrder {
  Order order;
  int tempQuantity; 

  ConfirmedOrder({ this.order, this.tempQuantity });
}