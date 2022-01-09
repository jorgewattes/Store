import 'package:flutter/cupertino.dart';
import 'package:store/data/dummy_products.dart';
import 'package:store/models/product.dart';

class ProductList extends ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((element) => element.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
