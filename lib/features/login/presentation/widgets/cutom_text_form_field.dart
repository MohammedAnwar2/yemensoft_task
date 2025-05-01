import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.text,
    this.controller,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
    this.onSaved,
  });
  final String? text;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.dartBlue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.lightBlue,
        focusedBorder: boardMethod(),
        enabledBorder: boardMethod(),
        // labelText: text,
        hintText: text,
        hintStyle: AppTextStyle.regular14.copyWith(),

        labelStyle: AppTextStyle.regular14,
        border: boardMethod(),
      ),
    );
  }

  OutlineInputBorder boardMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(width: 1, color: AppColors.lightBlue),
    );
  }
}
