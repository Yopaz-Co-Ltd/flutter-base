import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageFilePath;
  final double? width;
  final double? height;
  final BorderRadius? radius;
  final BoxFit? fit;
  final Color? tintColor;

  const ImageWidget({
    super.key,
    required this.imageFilePath,
    this.width,
    this.height,
    this.radius,
    this.fit,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
      ),
    );
  }
}
