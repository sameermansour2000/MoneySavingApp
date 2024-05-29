import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? isPassword;
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function()? onTap;
  final int? maxLines;
  const CustomTextField(
      {super.key,
      this.onTap,
      required this.controller,
      this.hintText,
      this.isPassword,
      this.prefix,
      this.keyboardType,
      this.validator,
      this.suffix,
      this.color,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        validator: validator,
        onTap: onTap,
        maxLines: maxLines,
        // enabled: onTap == null,
        decoration: InputDecoration(
          constraints: BoxConstraints(
            minHeight: 54,
            maxHeight: (MediaQuery.of(context).size.height / 5),
          ),
          prefixIcon: prefix,
          fillColor: color,
          filled: true,
          hintStyle:
              AppFonts.size14.copyWith(color: Colors.black.withOpacity(.4)),
          hintText: hintText,
          suffixIcon: suffix,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
