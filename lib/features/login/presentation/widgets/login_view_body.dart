import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_form_entities.dart';
import 'package:yemensoft_task/features/login/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_auth_button.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_login_form.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_top_header_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late LoginFormEntities loginFormEntities;
  @override
  void initState() {
    loginFormEntities = LoginFormEntities();
    loginFormEntities.initState();
    super.initState();
  }

  @override
  void dispose() {
    loginFormEntities.dispose();
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
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: 16),
          child: Column(
            children: [
              FadeInLeft(child: LoginTopHeaderSection()),
              Provider.value(
                value: loginFormEntities,
                child: CustomLoginForm(),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  child: Text('5'.tr(context), style: AppTextStyle.semiBold14),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                child: CustomLoginButton(
                  text: '6'.tr(context),
                  onPressed: () {
                    if (loginFormEntities.formKey.currentState!.validate()) {
                      LoginEntities loginEntities = LoginEntities(
                        delivryNO: loginFormEntities.userIdController.text,
                        password: loginFormEntities.passwordController.text,
                        lang: '2',
                      );
                      controller.login(loginEntities);
                    } else {
                      loginFormEntities.autovalidateMode =
                          AutovalidateMode.always;
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
      ),
    );
  }
}
