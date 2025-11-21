import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/presentation/view_models/product_view_model.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/button.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:uuid/uuid.dart';

class AddEditProductView extends ConsumerStatefulWidget {
  final Product? product;

  const AddEditProductView({super.key, this.product});

  @override
  ConsumerState<AddEditProductView> createState() => _AddEditProductViewState();
}

class _AddEditProductViewState extends ConsumerState<AddEditProductView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;
  late TextEditingController _imageController;
  String? _selectedCategory;

  final List<String> _categories = ['Food', 'Drink', 'Dessert', 'Other'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _descController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
    _imageController = TextEditingController(
      text: widget.product?.imageUrl ?? '',
    );
    _selectedCategory = widget.product?.category;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      final name = _nameController.text;
      final desc = _descController.text;
      final price = double.tryParse(_priceController.text) ?? 0.0;
      final image = _imageController.text;

      if (widget.product != null) {
        // Update
        final updatedProduct = widget.product!.copyWith(
          name: name,
          description: desc,
          price: price,
          imageUrl: image,
          category: _selectedCategory,
        );
        ref
            .read(productViewModelProvider.notifier)
            .updateProduct(updatedProduct);
      } else {
        // Add
        final newProduct = Product(
          id: const Uuid().v4(),
          name: name,
          description: desc,
          price: price,
          imageUrl: image,
          category: _selectedCategory!,
        );
        ref.read(productViewModelProvider.notifier).addProduct(newProduct);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;
    return Scaffold(
      appBar: CustomAppBar(title: isEditing ? 'Edit Product' : 'Add Product'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableTextField(
                controller: _nameController,
                hint: 'Product Name',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 12.h),
              ReusableTextField(
                controller: _descController,
                hint: 'Description',
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 12.h),
              ReusableTextField(
                controller: _priceController,
                hint: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  if (double.tryParse(value) == null) return 'Invalid price';
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              ReusableTextField(
                controller: _imageController,
                hint: 'Image URL',
              ),
              SizedBox(height: 12.h),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                hint: const Text('Select Category'),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              SizedBox(height: 24.h),
              AppButton(
                label: isEditing ? 'Update Product' : 'Add Product',
                fullWidth: true,
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
