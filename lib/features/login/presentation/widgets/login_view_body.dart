import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_form_entities.dart';
import 'package:yemensoft_task/features/login/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_auth_button.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/custom_login_form.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_top_header_section.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/show_more_button.dart';
import 'delivery_image_widget.dart';

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
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            const LoginTopHeaderSection(),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: Column(
                children: [
                  Provider.value(
                    value: loginFormEntities,
                    child: const CustomLoginForm(),
                  ),
                  const SizedBox(height: 25),
                  const ShowMoreButton(),
                  const SizedBox(height: 24),
                  CustomLoginButton(
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
                  const SizedBox(height: 49),
                  const DeliveryImageWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
