import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/Users/presentation/view_models/user_view_model.dart';
import 'package:sultan_admin/features/Users/presentation/views/user_details_view.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/search_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class UsersListView extends ConsumerStatefulWidget {
  const UsersListView({super.key});

  @override
  ConsumerState<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends ConsumerState<UsersListView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final List<String> _tabs = ['Confirmateur', 'Clients', 'Delivery'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      ref
          .read(userViewModelProvider.notifier)
          .setRole(_tabs[_tabController.index]);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
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
          TabBar(
            controller: _tabController,
            labelColor: context.c_primary,
            unselectedLabelColor: context.c_secondary,
            indicatorColor: context.c_primary,
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            onTap: (index) {
              // Handle tap if needed, but listener handles logic
              ref.read(userViewModelProvider.notifier).setRole(_tabs[index]);
            },
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
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  itemCount: users.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey.withOpacity(0.2)),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        user.name,
                        style: context.body?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        user.email,
                        style: context.body?.copyWith(
                          color: context.c_secondary,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red, size: 20.r),
                        onPressed: () {
                          ref
                              .read(userViewModelProvider.notifier)
                              .deleteUser(user.id);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserDetailsView(user: user),
                          ),
                        );
                      },
                    );
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
