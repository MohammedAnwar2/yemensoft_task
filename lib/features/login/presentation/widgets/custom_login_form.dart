import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/validated_inputs.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_form_entities.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/cutom_text_form_field.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final loginFormEntities = Provider.of<LoginFormEntities>(context);
    return Form(
      key: loginFormEntities.formKey,
      autovalidateMode: loginFormEntities.autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 132),
          FadeInRight(
            child: Text('1'.tr(context), style: AppTextStyle.semiBold29),
          ),
          const SizedBox(height: 12),
          FadeInLeft(
            child: Text('2'.tr(context), style: AppTextStyle.medium12),
          ),
          const SizedBox(height: 44),
          FadeInRight(
            child: CustomTextFormField(
              text: "3".tr(context),
              controller: loginFormEntities.userIdController,
              validator: (p0) {
                return validateInput(p0!, '24'.tr(context));
              },
            ),
          ),
          const SizedBox(height: 8),
          FadeInLeft(
            child: CustomTextFormField(
              text: "4".tr(context),
              controller: loginFormEntities.passwordController,
              validator: (p0) {
                return validateInput(p0!, '24'.tr(context));
              },
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}