import 'package:flutter/material.dart';
import 'order.dart';


class ConfirmedOrder {
  Order order;
  int tempQuantity; 
  int patunganPrice;

  ConfirmedOrder({ this.order, this.tempQuantity });
}