import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import '/providers/orders.dart';
import '../widget/Cart_Item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String routName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Your Cart")),
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          "\$${value.totalAmount}",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).primaryTextTheme.title!.color,
                      ),
                      Consumer<Order>(
                        builder: (context, order, child) {
                          return FlatButton(
                            onPressed: () {
                              order.addOrder(value.items.values.toList(),
                                  value.totalAmount);
                              value.clear();
                            },
                            child: Text("Order"),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, i) => CartItemList(
                    id: value.items.values.toList()[i].id,
                    price: value.items.values.toList()[i].price,
                    quantity: value.items.values.toList()[i].quantity,
                    title: value.items.values.toList()[i].title,
                    productId: value.items.keys.toList()[i],
                  ),
                  itemCount: value.itemCount,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
