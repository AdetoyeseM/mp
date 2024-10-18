import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  svg,
  png,
}

class MoniepointIcons extends StatelessWidget {
  const MoniepointIcons({
    super.key,
    required this.imageType,
    this.svg,
    this.png,
    this.color,
    this.height,
    this.width,
    this.fit,
  });

  final ImageType imageType;
  final String? svg, png;
  final Color? color;
  final double? height, width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.png:
        return Image.asset(
          "assets/images/pngs/$png.jpg",
          color: color,
          height: height,
          cacheHeight: height?.floor(),
          cacheWidth: width?.floor(),
          width: width,
          fit: fit ?? BoxFit.contain,
        );
      case ImageType.svg:
        return SvgPicture.asset(
          "assets/images/svgs/$svg.svg",
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.fitHeight,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
