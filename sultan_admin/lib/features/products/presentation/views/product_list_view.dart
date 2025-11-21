import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/presentation/view_models/product_view_model.dart';
import 'package:sultan_admin/features/products/presentation/views/add_edit_product_view.dart';
import 'package:sultan_admin/features/products/presentation/views/product_details_view.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/search_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class ProductListView extends ConsumerStatefulWidget {
  const ProductListView({super.key});

  @override
  ConsumerState<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends ConsumerState<ProductListView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Food', 'Drink', 'Dessert', 'Other'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        backgroundcolor: context.c_background,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.c_primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditProductView()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SearchField(
                  controller: _searchController,
                  hint: 'Search products...',
                  onChanged: (value) {
                    ref
                        .read(productViewModelProvider.notifier)
                        .setSearchQuery(value);
                  },
                  onClear: () {
                    _searchController.clear();
                    ref
                        .read(productViewModelProvider.notifier)
                        .setSearchQuery('');
                  },
                ),
                SizedBox(height: 12.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((category) {
                      final isSelected = _selectedCategory == category;
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
                              ref
                                  .read(productViewModelProvider.notifier)
                                  .setCategory(category);
                            }
                          },
                          selectedColor: context.c_primary,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : context.c_primary,
                          ),
                          backgroundColor: context.c_surface,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: productsAsync.when(
              data: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      'No products found',
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
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _ProductCard(product: product);
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

class _ProductCard extends ConsumerWidget {
  final Product product;

  const _ProductCard({required this.product});

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
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                    onError: (_, __) {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: context.h3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$${product.price}',
                    style: context.body?.copyWith(
                      color: context.c_primary,
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
