import 'package:arcpos/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeProductPageViewModel extends ChangeNotifier {
  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }
}
