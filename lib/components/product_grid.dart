import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/product_item.dart';
import 'package:store/models/product.dart';
import 'package:store/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid(this.showFavoriteOnly);
  final bool showFavoriteOnly;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductItem(),
      ),
    );
  }
}
