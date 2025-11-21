import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/features/Users/data/models/user_model.dart';
import 'package:sultan_admin/features/Users/data/services/user_service.dart';

class UserViewModel extends AsyncNotifier<List<User>> {
  late final UserService _service;
  List<User> _allUsers = [];
  String _searchQuery = '';
  String _selectedRole = 'Confirmateur'; // Default tab

  @override
  FutureOr<List<User>> build() async {
    _service = ref.watch(userServiceProvider);
    _allUsers = await _service.getAll();
    _applyFilters(); // Apply initial filter
    return state.value ?? [];
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void setRole(String role) {
    _selectedRole = role;
    _applyFilters();
  }

  void _applyFilters() {
    var filtered = _allUsers;

    // Filter by Role
    // Assuming tabs are: Confirmateur, Clients, Delivery
    // Mapping tab names to role strings if necessary, or using exact match
    // Let's assume exact match for now based on mock data
    // 'Clients' tab might map to 'Client' role
    String targetRole = _selectedRole;
    if (_selectedRole == 'Clients') targetRole = 'Client';

    filtered = filtered.where((user) => user.role == targetRole).toList();

    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((user) {
        return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.email.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

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
