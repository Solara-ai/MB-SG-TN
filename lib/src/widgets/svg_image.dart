import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage(
    this.assetName, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit,
  });

  const SvgImage.square(
    this.assetName, {
    super.key,
    double? demension,
    this.fit,
    this.color,
  })  : width = demension,
        height = demension;

  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final _color = color;

    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: _color != null
          ? ColorFilter.mode(
              _color,
              BlendMode.srcIn,
            )
          : null,
      fit: fit ?? BoxFit.contain,
    );
  }
}
