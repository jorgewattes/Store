import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/badge.dart';
import 'package:store/components/product_grid.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/product_list.dart';
import 'package:store/routes/app_routes.dart';

class ProductsOverviewPage extends StatefulWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Store!'),
        actions: [
          Consumer<Cart>(
              child: IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.CART),
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              builder: (context, cart, child) {
                return Badge(
                  value: cart.itemsCount.toString(),
                  child: child!,
                );
              }),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favorites Only'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: 1,
              ),
            ],
            onSelected: (int selectedValue) {
              setState(
                  () => showFavoriteOnly = selectedValue == 0 ? true : false);
            },
          ),
        ],
      ),
      body: ProductGrid(showFavoriteOnly),
    );
  }
}
