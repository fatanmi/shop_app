import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  static final routeName = "/product-details";
  @override
  Widget build(BuildContext context) {
    
    
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgs["id"];
    final productData = Provider.of<Products>(context,listen: false);
    final loadedItem = productData.findProductById(id!);
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedItem.title),
      ),
    );
  }
}
