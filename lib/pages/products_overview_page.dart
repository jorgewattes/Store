import 'package:flutter/material.dart';
import 'package:store/components/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Store!'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text('Text'),
              width: 200,
            ),
          ),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
