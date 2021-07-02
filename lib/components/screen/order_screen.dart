import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import '/components/widget/order_item.dart' as ord;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(
      builder: (context, orderData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Your Orders"),
          ),
          body: ListView.builder(itemBuilder: (ctx,index)=>
          ord.OrderItem(order: orderData.orders[index],)
          , itemCount: orderData.orders.length,),
        );
      },
    );
  }
}
