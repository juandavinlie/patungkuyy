import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/home/orders.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Order(
        name: doc.data['name'] ?? '',
        price: doc.data['price'] ?? 0,
        quantity: doc.data['quantity'] ?? 0,
        category: doc.data['category'] ?? '',
      );
    }).toList();
  }

  // collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  Future updateUserData(
      String name, int price, int quantity, String category) async {
    return await orderCollection.document(uid).setData({
      'name': name,
      'price': price,
      'quantity': quantity,
      'category': category
    });
  }

  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }
}
