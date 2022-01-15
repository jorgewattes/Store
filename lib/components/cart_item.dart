import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.only(right: 25),
        alignment: Alignment.centerRight,
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        child: Icon(Icons.delete_forever),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(item.productId);
        print('Removed');
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text('R\$${item.price}'),
            ),
          ),
          title: Text(item.title),
          subtitle: Text('Total R\$ ${item.price * item.quantity}'),
          trailing: Text('x${item.quantity}'),
        ),
      ),
    );
  }
}
