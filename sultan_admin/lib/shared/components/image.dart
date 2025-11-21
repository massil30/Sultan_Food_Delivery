import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ImageShape { circle, rectangle }

class ReusableImage extends StatelessWidget {
  final String? imageUrl;
  final File? fileImage;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageShape shape;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double borderRadius;

  const ReusableImage({
    Key? key,
    this.imageUrl,
    this.fileImage,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.shape = ImageShape.rectangle,
    this.placeholder,
    this.errorWidget,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (fileImage != null) {
      image = Image.file(
        fileImage!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildError(),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http')) {
        image = CachedNetworkImage(
          imageUrl: imageUrl!,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => _buildPlaceholder(),
          errorWidget: (context, url, error) => _buildError(),
        );
      } else {
        // Assume local path string if not http
        image = Image.file(
          File(imageUrl!),
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildError(),
        );
      }
    } else {
      image = _buildPlaceholder();
    }

    if (shape == ImageShape.circle) {
      return ClipOval(child: image);
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: image,
      );
    }
  }

  Widget _buildPlaceholder() {
    return placeholder ??
        Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        );
  }

  Widget _buildError() {
    return errorWidget ??
        Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        );
  }
}
