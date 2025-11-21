import 'package:sultan_admin/features/Users/data/models/user_model.dart';

abstract class UserRepo {
  Future<List<User>> getAll();
  Future<User?> getById(String id);
  Future<void> delete(String id);
}
