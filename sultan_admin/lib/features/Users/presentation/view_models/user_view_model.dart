import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/features/Users/data/models/user_model.dart';
import 'package:sultan_admin/features/Users/data/services/user_service.dart';

class UserViewModel extends AsyncNotifier<List<User>> {
  late final UserService _service;
  List<User> _allUsers = [];
  String _searchQuery = '';

  @override
  FutureOr<List<User>> build() async {
    _service = ref.watch(userServiceProvider);
    _allUsers = await _service.getAll();
    return _allUsers;
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    if (_searchQuery.isEmpty) {
      state = AsyncValue.data(_allUsers);
      return;
    }

    final filtered = _allUsers.where((user) {
      return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          user.email.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    state = AsyncValue.data(filtered);
  }

  Future<void> deleteUser(String id) async {
    state = const AsyncValue.loading();
    try {
      await _service.delete(id);
      // Refresh the list from source or update locally
      // Here we update locally for simplicity and then sync
      _allUsers.removeWhere((u) => u.id == id);
      _applyFilters();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final userViewModelProvider = AsyncNotifierProvider<UserViewModel, List<User>>(
  () {
    return UserViewModel();
  },
);
