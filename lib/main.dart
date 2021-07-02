import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/screen/cart_screen.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';

import '/components/screen/productOverviewHomeScreen.dart';
import '/components/screen/product_detail_screen.dart';
import './components/screen/homeScreen.dart';
import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Order(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: ThemeData(
            accentColor: Colors.amber,
            primaryColor: Color.fromRGBO(214, 173, 96, 1),
            canvasColor: Color.fromRGBO(244, 235, 208, 1),
            fontFamily: "Raleway",
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeData.light().textTheme.apply(
                  bodyColor: Color(0xFF3C4046),
                )
            // textTheme: Theme,
            ),
        home: ProductOverviewHomeScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
