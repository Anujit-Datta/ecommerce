import 'package:ecommerce/presentation/utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final double scale;
  const Logo({
    super.key,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.appLogo,
      height: scale,
      fit: BoxFit.fitHeight,
    );
  }
}