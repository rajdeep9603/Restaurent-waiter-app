import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';

class BackArrow extends StatelessWidget {
  final Color? fontColor;
  final VoidCallback? onTap;
  final double? fontSize;
  BackArrow({this.fontColor, this.fontSize, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: fontColor ?? ColorRes.maroon,
              size: fontSize ?? 25,
            ),
          ],
        ),
      ),
    );
  }
}
