import 'package:flutter/material.dart';
import 'productTxt.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final _items = ProductTxt().loadedProductTxt;

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  Product findProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  
}
