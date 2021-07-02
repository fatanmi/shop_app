import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItemList extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  final String productId;
  const CartItemList({
    Key? key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          value.removeItem(productId);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(child: Text("\$$price")),
                ),
              ),
              title: Text(title),
              subtitle: Text("Total: \$${price * quantity}"),
              trailing: Text("$quantity x"),
            ),
          ),
        ),
      );
    });
  }
}
