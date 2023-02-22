import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget outBorderTextFormField({
  bool? enabled,
  double? size,
  TextInputType? keyboardType,
  TextEditingController? controller,
  String? Function(String?)? validation,
  InputBorder? border,
  FocusNode? focusNode,
  bool? obscureText,
}) {
  return TextFormField(
    enabled: enabled,
    focusNode: focusNode,
    controller: controller,
    validator: validation,
    keyboardType: keyboardType,
    style: GoogleFonts.poppins(),
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      hintStyle: GoogleFonts.poppins(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder:  OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.red, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.red, width: 1.0),
      ),
      errorStyle: GoogleFonts.poppins(),
      filled: true,
      // fillColor: isSelectedTheme == "Dark"
      //     ? Themes.light
      //     : ColorRes.maroonRed.withOpacity(0.2),
    ),
  );
}
