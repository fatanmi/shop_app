import 'package:flutter/material.dart';
import "../widget/productsGrid.dart";

// import '../../models/productTxt.dart';

class ProductOverviewHomeScreen extends StatelessWidget {
  // final List _kProduct = ProductTxt().loadedProductTxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: ProductsGrid(),
    );
  }
}
