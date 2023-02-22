import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonTextFormField({
  double? size,
  String? hintText,
  TextInputType? keyboardType,
  required TextEditingController? controller,
  String? Function(String?)? validation,
  InputBorder? border,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? obscureText,
  TextStyle? hintStyle,
  FocusNode? focusNode,
}) {
  return TextFormField(
    textAlign: TextAlign.left,
    focusNode: focusNode,
    controller: controller,
    validator: validation,
    obscureText: obscureText ?? false,
    keyboardType: keyboardType,
    // style: GoogleFonts.poppins(color: isSelectedTheme == "Dark" ? Themes.light : ColorRes.black),
    style: GoogleFonts.poppins(),
    decoration: InputDecoration(
      alignLabelWithHint: true,
      suffixIcon: suffixIcon,
      errorStyle: GoogleFonts.poppins(),
      contentPadding: EdgeInsets.only(left: 15),
      hintText: hintText,
      hintStyle: hintStyle ?? null,
      border: borderTextfield(),
      focusedBorder: borderTextfield(),
      prefixIcon: prefixIcon,
      enabledBorder: borderTextfield(),
      errorBorder: borderTextfield(),
      disabledBorder: borderTextfield(),
      focusedErrorBorder: borderTextfield(),
    ),
  );
}

OutlineInputBorder borderTextfield() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.grey),
  );
}
