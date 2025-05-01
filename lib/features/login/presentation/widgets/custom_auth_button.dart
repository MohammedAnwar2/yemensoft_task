import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              elevation: 0,
              onPressed: onPressed,
              color: AppColors.dartBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                text,
                style: AppTextStyle.medium16.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
