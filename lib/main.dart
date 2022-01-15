import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/pages/products_overview_page.dart';
import 'package:store/models/product_list.dart';
import 'package:store/routes/app_routes.dart';

import 'models/cart.dart';
import 'models/order_list.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            appBarTheme: AppBarTheme(centerTitle: true),
            primaryColor: Colors.purple,
            colorScheme: ColorScheme(
                primary: Colors.purple,
                primaryVariant: Colors.deepPurple,
                secondary: Colors.deepOrange,
                secondaryVariant: Colors.orange,
                surface: Colors.white,
                background: Colors.white,
                error: Colors.red,
                onPrimary: Colors.black,
                onSecondary: Colors.white,
                onSurface: Colors.black,
                onBackground: Colors.black,
                onError: Colors.black,
                brightness: Brightness.light),
            primarySwatch: Colors.purple),
        //home: MyHomePage(),
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (context) => ProductsOverviewPage(),
          AppRoutes.PRODUCTDETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => CartPage(),
          AppRoutes.ORDERS: (context) => OrdersPage(),
        },
      ),
    );
  }
}
