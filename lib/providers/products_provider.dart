import 'package:flutter/material.dart';
import 'productTxt.dart';
import 'dart:developer';

import 'product.dart';

class Products with ChangeNotifier {
  List _items = ProductTxt().loadedProductTxt;

  bool _showFavoriteOnly = false;

  List<Product> get items {
    

    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }

  List<Product> get favouritItems {
    return [..._items.where((prodItems) => prodItems.isFavorite)];
  }

  Product findProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
