import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';

class ProductService {
  // Simulating a backend with in-memory storage
  final List<Product> _products = [];

  Future<List<Product>> getAll() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [..._products];
  }

  Future<void> add(Product product) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _products.add(product);
  }

  Future<void> update(Product updatedProduct) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _products.removeWhere((p) => p.id == id);
  }
}

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});
