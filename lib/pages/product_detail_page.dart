import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Image.network(product.imageUrl),
      ),
    );
  }
}
