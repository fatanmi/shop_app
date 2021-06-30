import 'package:flutter/material.dart';
import 'productTxt.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List _items = ProductTxt().loadedProductTxt;

  bool _showFavoriteOnly = false;
  List<Product> get items {
    if (_showFavoriteOnly) {
      print("In Favorite Only");
      print([..._items.where((prod) => prod.isFavorite == _showFavoriteOnly)]);
      return [..._items.where((prod) => prod.isFavorite == _showFavoriteOnly)];
      // notifyListeners();

    }
    notifyListeners();
    print("In All Only");
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  void showFavOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
    // _showFavoriteOnly = false;
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  Product findProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
