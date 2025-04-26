import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/validated_inputs.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_auth_button.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/cutom_text_form_field.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_top_header_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  @override
  void initState() {
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;

    super.initState();
  }

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    autovalidateMode = AutovalidateMode.disabled;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginCubit>();
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              FadeInLeft(child: LoginTopHeaderSection()),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 132),
                    FadeInRight(child: Text('1'.tr(context), style: AppTextStyle.semiBold29)),
                    const SizedBox(height: 12),
                    FadeInLeft(
                      child: Text(
                        '2'.tr(context),
                        style: AppTextStyle.medium12,
                      ),
                    ),
                    const SizedBox(height: 44),
                    FadeInRight(
                      child: CustomTextFormField(
                        text: "3".tr(context),
                        controller: userIdController,
                        validator: (p0) {
                          return validateInput(p0!,'24'.tr(context));
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInLeft(
                      child: CustomTextFormField(
                        text: "4".tr(context),
                        controller: passwordController,
                        validator: (p0) {
                          return validateInput(p0!,'24'.tr(context));
                        },
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        child: Text(
                          '5'.tr(context),
                          style: AppTextStyle.semiBold14,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 24),
                    FadeInUp(
                      child: CustomLoginButton(
                        text: '6'.tr(context),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginEntities loginEntities = LoginEntities(
                              delivryNO: userIdController.text,
                              password: passwordController.text,
                              lang: '2',
                            );
                            controller.login(loginEntities);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 49),
                    FadeInUp(child: SvgPicture.asset(AppImages.imagesDelivery)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
