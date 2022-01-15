import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store/models/order.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget(this.order, {Key? key}) : super(key: key);
  final Order order;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
            trailing: IconButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              icon: Icon(Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              height: widget.order.products.length * 30 + 10,
              padding: EdgeInsets.all(10),
              child: ListView(
                children: widget.order.products
                    .map(
                      (item) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '  ${item.quantity}x R\$${item.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
