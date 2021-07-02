import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/screen/product_detail_screen.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final prod = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: {"id": prod.id},
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            prod.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: Container(
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: GridTileBar(
                title: Text(
                  prod.title,

                  style: TextStyle(fontFamily: "Raleway"),
                  // softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                leading: IconButton(
                  icon:
                      Icon(prod.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                  onPressed: () {
                    prod.toggleFavorite();
                  },
                  color: Theme.of(context).accentColor,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    cart.addItems(prod.title, prod.id, prod.price);
                  },
                  color: Theme.of(context).accentColor,
                ),
                backgroundColor: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
