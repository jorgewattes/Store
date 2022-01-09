import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/counter.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${CounterProvider.of(context)?.state.value ?? 0}'),
            IconButton(
              onPressed: () {
                setState(() {
                  CounterProvider.of(context)?.state.inc();
                  print('${CounterProvider.of(context)?.state.value ?? 0}');
                });
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  CounterProvider.of(context)?.state.dec();
                  print('${CounterProvider.of(context)?.state.value ?? 0}');
                });
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
