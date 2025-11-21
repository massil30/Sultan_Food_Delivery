import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ImageShape { circle, rectangle }

class ReusableCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageShape shape;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double borderRadius;

  const ReusableCachedImage({
    Key? key,
    required this.imageUrl,
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
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: const Center(child: CircularProgressIndicator()),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
    );

    if (shape == ImageShape.circle) {
      return ClipOval(child: image);
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: image,
      );
    }
  }
}
