import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/pages/products_overview_page.dart';
import 'package:store/models/product_list.dart';
import 'package:store/routes/app_routes.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductList(),
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
        initialRoute: AppRoutes.PRODUCTSOVERVIEW,
        routes: {
          AppRoutes.PRODUCTSOVERVIEW: (context) => ProductsOverviewPage(),
          AppRoutes.PRODUCTDETAIL: (context) => ProductDetailPage()
        },
      ),
    );
  }
}
