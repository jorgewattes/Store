import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    Order order = Order(
      id: Random().nextDouble().toString(),
      total: cart.totalAmound,
      products: cart.item.values.toList(),
      date: DateTime.now(),
    );
    _items.insert(0, order);
    notifyListeners();
  }
}
