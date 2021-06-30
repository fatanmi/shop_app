import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import "../widget/productsGrid.dart";

// import '../../models/productTxt.dart';

enum filterFavoriteProd { Favorites, All }

class ProductOverviewHomeScreen extends StatelessWidget {
  // final List _kProduct = ProductTxt().loadedProductTxt;

  // final productsContainer =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: [
          PopupMenuButton(
              onSelected: (selectedValue) {
                print(selectedValue);
                if (selectedValue == filterFavoriteProd.Favorites) {
                  context.read<Products>().showFavOnly();
                } else {
                  context.read<Products>().showAll();
                }
              },
              padding: EdgeInsets.all(5),
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text(
                        "Only Favorites",
                      ),
                      value: filterFavoriteProd.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: filterFavoriteProd.All,
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value: 2,
                    )
                  ])
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
