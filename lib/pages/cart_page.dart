import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/cart_item.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/cart_item.dart';
import 'package:store/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    List<CartItem> items = cart.item.values.toList();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 5),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      'R\$ ${cart.totalAmound}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6!
                              .color),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderList>(context, listen: false)
                          .addOrder(cart);
                      cart.clear();
                    },
                    child: Text(
                      'Comprar',
                    ),
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemsCount,
                itemBuilder: (ctx, i) {
                  // CartItem item = cart.item[cart.item.keys.toList()[i]]!;
                  return CartItemWidget(item: items[i]);
                }),
          ),
        ],
      ),
    );
  }
}
