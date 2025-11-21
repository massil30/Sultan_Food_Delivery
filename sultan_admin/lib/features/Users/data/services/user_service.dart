import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/features/Users/data/models/user_model.dart';
import 'package:sultan_admin/features/Users/data/services/user_repo.dart';

class UserService implements UserRepo {
  // Simulating a backend with in-memory storage
  final List<User> _users = [
    User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+1234567890',
      imageUrl: 'https://i.pravatar.cc/150?u=1',
      role: 'Admin',
      status: 'Active',
    ),
    User(
      id: '2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '+0987654321',
      imageUrl: 'https://i.pravatar.cc/150?u=2',
      role: 'User',
      status: 'Active',
    ),
    User(
      id: '3',
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
      phoneNumber: '+1122334455',
      imageUrl: 'https://i.pravatar.cc/150?u=3',
      role: 'User',
      status: 'Inactive',
    ),
    User(
      id: '4',
      name: 'Bob Brown',
      email: 'bob.brown@example.com',
      phoneNumber: '+5544332211',
      imageUrl: 'https://i.pravatar.cc/150?u=4',
      role: 'Manager',
      status: 'Active',
    ),
  ];

  Future<List<User>> getAll() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [..._users];
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _users.removeWhere((u) => u.id == id);
  }

  Future<User?> getById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _users.firstWhere((u) => u.id == id);
    } catch (e) {
      return null;
    }
  }
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});
