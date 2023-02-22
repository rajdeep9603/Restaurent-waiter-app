import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonContainer({
  String? text,
  double? width,
  double? height,
  Color? color,
  AlignmentGeometry? alignment,
  VoidCallback? onTap,
  Decoration? decoration,
  TextStyle? style,
  Widget? child,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
        child: child ??
            Text(
              text!,
              style: style,
            ),
      ),
    ),
  );
}
