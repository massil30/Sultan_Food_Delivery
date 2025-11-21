import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/data/services/product_repo.dart';

class ProductService implements ProductRepo {
  // Simulating a backend with in-memory storage
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Burger',
      description: 'Delicious beef burger',
      price: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      category: 'Food',
    ),
    Product(
      id: '2',
      name: 'Coke',
      description: 'Cold cola drink',
      price: 2.5,
      imageUrl:
          'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGNvY2ElMjBjb2xhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      category: 'Drink',
    ),
  ];

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
