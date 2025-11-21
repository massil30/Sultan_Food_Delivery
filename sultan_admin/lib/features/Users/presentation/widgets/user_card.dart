import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/Users/data/models/user_model.dart';
import 'package:sultan_admin/features/Users/presentation/view_models/user_view_model.dart';
import 'package:sultan_admin/features/Users/presentation/views/user_details_view.dart';
import 'package:sultan_admin/shared/components/image.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class UserCard extends ConsumerWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserDetailsView(user: user)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.c_surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ReusableImage(
                imageUrl: user.imageUrl,
                width: double.infinity,
                height: double.infinity,
                borderRadius: 12.r,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),
                  Text(
                    user.name,
                    style: context.body?.copyWith(
                      color: context.c_textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.role,
                    style: context.small?.copyWith(color: context.c_secondary),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(userViewModelProvider.notifier)
                              .deleteUser(user.id);
                        },
                        child: Icon(
                          Icons.delete,
                          size: 20.r,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
