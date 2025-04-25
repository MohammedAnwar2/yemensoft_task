import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/validated_inputs.dart';
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
                    CustomTextFormField(
                      text: "User ID",
                      controller: userIdController,
                      validator: (p0) {
                        return validateInput(p0!);
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      text: "Password",
                      controller: passwordController,
                      validator: (p0) {
                        return validateInput(p0!);
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        child: Text(
                          'Show More',
                          style: AppTextStyle.semiBold14,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomLoginButton(
                      text: 'Log in',
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
                    const SizedBox(height: 49),
                    SvgPicture.asset(AppImages.imagesDelivery),
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
