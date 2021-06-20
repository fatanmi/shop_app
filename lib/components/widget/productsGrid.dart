import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import 'productItem.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    final _products = productData.items;
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (ctx) {
            return _products[i];
          },
          child: ProductItem(
              // id: _products[i].id,
              // title: _products[i].title,
              // imageUrl: _products[i].imageUrl,
              ),
        ),
      ),
    );
  }
}
