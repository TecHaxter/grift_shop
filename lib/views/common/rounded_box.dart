import 'package:flutter/material.dart';
import 'package:grift_shop/utils/utils.dart';

class RoundedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final bool? paddingDisable;
  final Widget child;
  const RoundedBox({
    Key? key,
    this.width,
    this.height,
    this.borderWidth,
    this.borderRadius,
    this.paddingDisable,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth ?? 1),
        borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
      ),
      padding: (paddingDisable ?? false) ? null : EdgeInsets.all(8.r),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: (paddingDisable ?? true) && (paddingDisable != true)
            ? BorderRadius.zero
            : BorderRadius.circular(borderRadius ?? 24.r),
        child: child,
      ),
    );
  }
}
