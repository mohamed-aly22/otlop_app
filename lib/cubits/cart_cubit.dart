import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/cubits/cart_states.dart';
import 'package:otlop_app/models/product_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  List<ProductModel> products = [];
  List<int> quantities = [];

  void addProduct(ProductModel product, {int quantity = 1}) {
    final index = products.indexWhere(
      (item) => item.name == product.name && item.restaurant == product.restaurant,
    );

    if (index == -1) {
      products.add(product);
      quantities.add(quantity);
    } else {
      quantities[index] += quantity;
    }

    emit(CartUpdated());
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
    emit(CartUpdated());
  }

  void decrease(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
    } else {
      products.removeAt(index);
      quantities.removeAt(index);
    }
    emit(CartUpdated());
  }

  void clear() {
    products.clear();
    quantities.clear();
    emit(CartUpdated());
  }
}