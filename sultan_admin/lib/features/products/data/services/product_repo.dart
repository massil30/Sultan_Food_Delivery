//Here i can define only function Interface
import 'package:sultan_admin/features/products/data/models/product_model.dart';

abstract class ProductRepo {
  Future<List<Product>> getAll();
  Future<void> add(Product product);
  Future<void> update(Product updatedProduct);
  Future<void> delete(String id);
}
