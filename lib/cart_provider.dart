import 'package:flutter/material.dart';
import 'product_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double calculateTotalPrice() {
    return _cartItems.fold(0.0, (total, product) => total + product.price);
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
