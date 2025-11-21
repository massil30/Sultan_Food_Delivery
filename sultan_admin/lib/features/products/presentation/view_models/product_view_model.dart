import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/data/services/product_service.dart';

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductService _service;
  List<Product> _allProducts = [];
  String _searchQuery = '';
  String? _selectedCategory;

  ProductViewModel(this._service) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      _allProducts = await _service.getAll();
      _applyFilters();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void setCategory(String? category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void _applyFilters() {
    var filtered = _allProducts;

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    if (_selectedCategory != null && _selectedCategory != 'All') {
      filtered = filtered
          .where((p) => p.category == _selectedCategory)
          .toList();
    }

    state = AsyncValue.data(filtered);
  }

  Future<void> addProduct(Product product) async {
    try {
      await _service.add(product);
      await loadProducts();
    } catch (e) {
      // Handle error
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
