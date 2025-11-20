import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/data/services/product_service.dart';

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductService _service;

  ProductViewModel(this._service) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final products = await _service.getAll();
      state = AsyncValue.data(products);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await _service.add(product);
      // Optimistic update or reload
      await loadProducts();
    } catch (e) {
      // Handle error (maybe show toast via a side effect provider or callback,
      // but for now we just reload or keep state)
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      await _service.update(product);
      await loadProducts();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _service.delete(id);
      await loadProducts();
    } catch (e) {
      // Handle error
    }
  }
}

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, AsyncValue<List<Product>>>((ref) {
      final service = ref.watch(productServiceProvider);
      return ProductViewModel(service);
    });
