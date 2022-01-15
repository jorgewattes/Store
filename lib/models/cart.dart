import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:store/models/cart_item.dart';
import 'package:store/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};
  Map<String, CartItem> get item => {..._item};

  int get itemsCount => _item.keys.length;

  double get totalAmound {
    double total = 0;
    _item.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product item) {
    if (_item.containsKey(item.id)) {
      _item.update(item.id, (existingItem) {
        return CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        );
      });
    } else
      _item.putIfAbsent(
        item.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: item.id,
          title: item.title,
          quantity: 1,
          price: item.price,
        ),
      );
    notifyListeners();
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void clear() {
    _item.clear();
    notifyListeners();
  }
}
