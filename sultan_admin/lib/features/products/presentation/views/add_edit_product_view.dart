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

            ],
          ),
        ),
      ),
    );
  }
}
