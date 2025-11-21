import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/presentation/view_models/product_view_model.dart';
import 'package:sultan_admin/features/products/presentation/views/add_edit_product_view.dart';
import 'package:sultan_admin/features/products/presentation/views/product_details_view.dart';
import 'package:sultan_admin/shared/components/image.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsView(product: product),
          ),
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
                imageUrl: product.imageUrl,
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
                    '\$${product.price}',
                    style: context.body?.copyWith(
                      color: context.c_textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.name,
                    style: context.body?.copyWith(
                      color: context.c_textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  AddEditProductView(product: product),
                            ),
                          );
                        },
                        child: Icon(Icons.edit, size: 20.r, color: Colors.blue),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {
                          ref
                              .read(productViewModelProvider.notifier)
                              .deleteProduct(product.id);
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
