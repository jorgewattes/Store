import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/routes/app_routes.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.PRODUCTDETAIL, arguments: product);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(product.title),
            backgroundColor: Colors.black54,
            leading: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: product.toggleFavorite,
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
