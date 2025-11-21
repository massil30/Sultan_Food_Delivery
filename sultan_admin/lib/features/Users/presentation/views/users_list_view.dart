import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/Users/presentation/view_models/user_view_model.dart';
import 'package:sultan_admin/features/Users/presentation/widgets/user_card.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/search_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';

class UsersListView extends ConsumerStatefulWidget {
  const UsersListView({super.key});

  @override
  ConsumerState<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends ConsumerState<UsersListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Users', backgroundcolor: context.c_surface),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: SearchField(
              controller: _searchController,
              hint: 'Search users...',
              onChanged: (value) {
                ref.read(userViewModelProvider.notifier).setSearchQuery(value);
              },
              onClear: () {
                _searchController.clear();
                ref.read(userViewModelProvider.notifier).setSearchQuery('');
              },
            ),
          ),
          Expanded(
            child: usersAsync.when(
              data: (users) {
                if (users.isEmpty) {
                  return Center(
                    child: Text(
                      'No users found',
                      style: TextStyle(color: context.c_secondary),
                    ),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserCard(user: user);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
