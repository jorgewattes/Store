import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: cart.itemsCount,
          itemBuilder: (ctx, i) {
            CartItem item = cart.item[cart.item.keys.toList()[i]]!;
            return Card(
              child: ListTile(
                leading: Text(
                  item.quantity.toString(),
                ),
                title: Text(item.title),
                subtitle: Text('${item.quantity}x R\$${item.price}'),
                trailing: Text('R\$${item.price * item.quantity}'),
              ),
            );
          }),
    );
  }
}
