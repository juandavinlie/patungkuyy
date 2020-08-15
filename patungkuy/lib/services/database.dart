import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final String uid;
  final Uuid unique = Uuid();
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

  List<TempOrder> _tempOrderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return TempOrder(
        order: Order(
            name: doc.data['name'] ?? '',
            price: doc.data['price'] ?? 0,
            quantity: doc.data['quantity'] ?? 0,
            category: doc.data['category'] ?? '',
        ),
        tempQuantity: doc.data['tempQuantity']
      );
    }).toList();
  }

  // collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  final CollectionReference userCollection = 
      Firestore.instance.collection('users');
  

  Future updateUserData(
      String name, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email
    });
  }

  Future updateOrderData(
      String name, int price, int quantity, String category) async {
    return await orderCollection.document(name).setData({
      'name': name,
      'price': price,
      'quantity': quantity,
      'category': category
    });
  }

  Future updateTempOrderData(
      String name, int price, int quantity, String category, int tempQuantity) async {
    return await userCollection.document(uid).collection('mycart').document(name).setData({
      'name': name,
      'price': price,
      'quantity': quantity,
      'category': category,
      'tempQuantity': tempQuantity
    });
  }

  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }

  Stream<List<TempOrder>> get tempOrders {
    return Firestore.instance.collection('users').document(uid).collection('mycart').snapshots().map(_tempOrderListFromSnapshot);
  }

  void deleteData(String uidOFDeleted) {
    Firestore.instance.collection('users').document(uid).collection('mycart').document(uidOFDeleted).delete();
  }

}
