import 'package:flutter/material.dart';
import 'package:flutter_shops/dummy_data.dart';
import 'package:flutter_shops/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCT;

  List<Product> get items{
    return [..._items];
  }

  Product findById(productId){
    return _items.firstWhere((item) => item.id == productId);
  }

  void addProduct(product){
    _items.add(product);
    notifyListeners();
  }
}
