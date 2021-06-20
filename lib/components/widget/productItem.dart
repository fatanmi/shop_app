import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/screen/product_detail_screen.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final prod = Provider.of<Product>(context, listen: false);

    return Consumer<Product>(
      builder: (context, value, child) {
        print("Rebuild Product ${value.id}");
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: {"id": value.id},
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: Image.network(
                value.imageUrl,
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
                      value.title,

                      style: TextStyle(fontFamily: "Raleway"),
                      // softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    leading: IconButton(
                      icon:
                          // Icon(Icons.favorite),
                          Icon(value.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                      onPressed: () {
                        value.toggleFavorite();
                      },
                      color: Theme.of(context).accentColor,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {},
                      color: Theme.of(context).accentColor,
                    ),
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
