import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import 'productItem.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorite;

  const ProductsGrid({Key? key, required this.showFavorite}) : super(key: key);
  
  
  @override
  
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(
      context,
    );

    final _products =
        showFavorite ? productData.favouritItems : productData.items;

    inspect(_products);
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: _products[i],
          child: ProductItem(),
        ),
      ),
    );
  }
}
