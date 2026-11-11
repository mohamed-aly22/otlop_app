import 'package:flutter/foundation.dart';
import 'package:otlop_app/models/product_model.dart';

class CartManager extends ChangeNotifier {
  CartManager._();
  static final CartManager instance = CartManager._();

  final List<ProductModel> products = [];
  final List<int> quantities = [];

  void addProduct(ProductModel product, {int quantity = 1}) {
    final index = products.indexWhere(
      (p) => p.name == product.name && p.restaurant == product.restaurant,
    );

    if (index == -1) {
      products.add(product);
      quantities.add(quantity);
    } else {
      quantities[index] += quantity;
    }

    notifyListeners();
  }

  void addFromMap(Map item, {int quantity = 1}) {
    addProduct(
      ProductModel(
        image: item['pictureUrl'] ?? '',
        category: item['category'] ?? '',
        restaurant: item['brand'] ?? '',
        name: item['name'] ?? '',
        price: (item['price'] ?? 0).toInt(),
      ),
      quantity: quantity,
    );
  }

  void increase(int index) {
    quantities[index]++;
    notifyListeners();
  }

  void decrease(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
    } else {
      products.removeAt(index);
      quantities.removeAt(index);
    }
    notifyListeners();
  }

  void clear() {
    products.clear();
    quantities.clear();
    notifyListeners();
  }
}
