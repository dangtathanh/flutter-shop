import 'package:flutter/material.dart';
import 'package:flutter_shops/dummy_data.dart';
import 'package:flutter_shops/models/product.dart';

class Producs with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCT;

  List<Product> get items{
    return [..._items];
  }

  void addProduct(product){
    _items.add(product);
    notifyListeners();
  }
}
