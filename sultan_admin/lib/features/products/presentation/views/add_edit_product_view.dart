import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sultan_admin/features/products/data/models/product_model.dart';
import 'package:sultan_admin/features/products/presentation/view_models/product_view_model.dart';
import 'package:sultan_admin/shared/components/app_bar.dart';
import 'package:sultan_admin/shared/components/button.dart';
import 'package:sultan_admin/shared/components/image.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
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
  String? _selectedCategory;
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

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
    _selectedCategory = widget.product?.category;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      if (_pickedImage == null &&
          (widget.product == null || widget.product!.imageUrl.isEmpty)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please select an image')));
        return;
      }

      final name = _nameController.text;
      final desc = _descController.text;
      final price = double.tryParse(_priceController.text) ?? 0.0;
      // Use new image path if picked, otherwise keep existing
      final image = _pickedImage?.path ?? widget.product?.imageUrl ?? '';

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
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _pickedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(_pickedImage!, fit: BoxFit.cover),
                        )
                      : (widget.product != null &&
                            widget.product!.imageUrl.isNotEmpty)
                      ? ReusableImage(
                          imageUrl: widget.product!.imageUrl,
                          width: double.infinity,
                          height: 200.h,
                          borderRadius: 12.r,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 40.r,
                              color: Colors.grey[600],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Tap to add image',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 20.h),
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
