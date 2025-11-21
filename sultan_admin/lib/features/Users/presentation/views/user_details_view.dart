import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/Users/data/models/user_model.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';
import 'package:sultan_admin/shared/components/image.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'User Details'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ReusableImage(
                imageUrl: user.imageUrl,
                width: 120.w,
                height: 120.w,
                borderRadius: 60.r,
              ),
            ),
            SizedBox(height: 20.h),
            _buildDetailRow(context, 'Name', user.name),
            _buildDetailRow(context, 'Email', user.email),
            _buildDetailRow(context, 'Phone', user.phoneNumber),
            _buildDetailRow(context, 'Role', user.role),
            _buildDetailRow(context, 'Status', user.status),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style: context.body?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: context.body)),
        ],
      ),
    );
  }
}
