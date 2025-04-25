import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_auth_button.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/cutom_text_form_field.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_top_header_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            LoginTopHeaderSection(),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 16),
              child: Column(
                children: [
                  const SizedBox(height: 132),
                  Text('Welcome Back!', style: AppTextStyle.semiBold29),
                  const SizedBox(height: 12),
                  Text(
                    'Log back into your account',
                    style: AppTextStyle.medium12,
                  ),
                  const SizedBox(height: 44),
                  CustomTextFormField(text: "User ID"),
                  const SizedBox(height: 8),
                  CustomTextFormField(text: "Password"),
                  const SizedBox(height: 25),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      child: Text('Show More', style: AppTextStyle.semiBold14),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomLoginButton(text: 'Log in', onPressed: () {}),
                  const SizedBox(height: 49),
                  SvgPicture.asset(AppImages.imagesDelivery),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
