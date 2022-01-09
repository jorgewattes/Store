import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/product_item.dart';
import 'package:store/models/product.dart';
import 'package:store/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;
    return GridView.builder(
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider(
        create: (_) => loadedProducts[i],
        child: ProductItem(),
      ),
    );
  }
}
