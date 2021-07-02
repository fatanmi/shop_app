import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/screen/cart_screen.dart';
import 'package:shop_app/components/widget/badge.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_provider.dart';
import "../widget/productsGrid.dart";

// import '../../models/productTxt.dart';

enum filterFavoriteProd { Favorites, All, Cart }

class ProductOverviewHomeScreen extends StatefulWidget {
  // final List _kProduct = ProductTxt().loadedProductTxt;

  @override
  _ProductOverviewHomeScreenState createState() =>
      _ProductOverviewHomeScreenState();
}

class _ProductOverviewHomeScreenState extends State<ProductOverviewHomeScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == filterFavoriteProd.Favorites) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
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
                child: Text("Cart"),
                value: 2,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, value, __) {
              return Badge(
                value: value.itemCount.toString(),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routName,
                      arguments: {},
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ProductsGrid(
        showFavorite: _showOnlyFavorite,
      ),
    );
  }
}
