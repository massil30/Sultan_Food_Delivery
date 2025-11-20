import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/features/products/model.dart';
import 'package:sultan_admin/features/products/provider.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/button.dart';
import 'package:sultan_admin/shared/components/list.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';
import 'package:uuid/uuid.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage({super.key});

  @override
  ConsumerState<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();

  String? _editingId;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _nameController.clear();
    _descController.clear();
    _priceController.clear();
    _imageController.clear();
    setState(() {
      _editingId = null;
    });
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final desc = _descController.text;
      final price = double.tryParse(_priceController.text) ?? 0.0;
      final image = _imageController.text;

      if (_editingId != null) {
        // Update
        final updatedProduct = Product(
          id: _editingId!,
          name: name,
          description: desc,
          price: price,
          imageUrl: image,
        );
        ref.read(productProvider.notifier).updateProduct(updatedProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product updated successfully')),
        );
      } else {
        // Add
        final newProduct = Product(
          id: const Uuid().v4(),
          name: name,
          description: desc,
          price: price,
          imageUrl: image,
        );
        ref.read(productProvider.notifier).addProduct(newProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
        );
      }
      _clearForm();
    }
  }

  void _onEdit(Product product) {
    setState(() {
      _editingId = product.id;
      _nameController.text = product.name;
      _descController.text = product.description;
      _priceController.text = product.price.toString();
      _imageController.text = product.imageUrl;
    });
  }

  void _onDelete(String id) {
    ref.read(productProvider.notifier).deleteProduct(id);
    if (_editingId == id) {
      _clearForm();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Manage Products'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _editingId != null ? 'Edit Product' : 'Add New Product',
              style: context.h2,
            ),
            SizedBox(height: 16.h),
            Form(
              key: _formKey,
              child: Column(
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
                  SizedBox(height: 24.h),
                  AppButton(
                    label: _editingId != null ? 'Update Product' : 'Add Product',
                    fullWidth: true,
                    onPressed: _onSubmit,
                  ),
                  if (_editingId != null) ...[
                    SizedBox(height: 12.h),
                    AppOutlinedButton(
                      label: 'Cancel Edit',
                      fullWidth: true,
                      onPressed: _clearForm,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 16.h),
            Text('All Products (${products.length})', style: context.h2),
            SizedBox(height: 16.h),
            if (products.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text('No products added yet', style: context.body),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ReusableListItem(
                    title: product.name,
                    subtitle: '${product.price} - ${product.description}',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _onEdit(product),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _onDelete(product.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
