import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageWidget extends StatelessWidget {
  final String imageFilePath;
  final double? width;
  final double? height;
  final BorderRadius? radius;
  final BoxFit? fit;

  const SvgImageWidget({
    super.key,
    required this.imageFilePath,
    this.width,
    this.height,
    this.radius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: SvgPicture.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
