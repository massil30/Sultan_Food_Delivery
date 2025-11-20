import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Details'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.imageUrl.isNotEmpty)
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                    onError: (_, __) {},
                  ),
                ),
              ),
            SizedBox(height: 20.h),
            Text(product.name, style: context.h1),
            SizedBox(height: 8.h),
            Text(
              '\$${product.price}',
              style: context.h2?.copyWith(color: Colors.green),
            ),
            SizedBox(height: 16.h),
            Text('Description', style: context.h3),
            SizedBox(height: 8.h),
            Text(product.description, style: context.body),
          ],
        ),
      ),
    );
  }
}
