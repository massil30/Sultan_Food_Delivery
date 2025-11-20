import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sultan_admin/features/products/model.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void updateProduct(Product updatedProduct) {
    state = [
      for (final product in state)
        if (product.id == updatedProduct.id) updatedProduct else product,
    ];
  }

  void deleteProduct(String id) {
    state = state.where((product) => product.id != id).toList();
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>((
  ref,
) {
  return ProductNotifier();
});
