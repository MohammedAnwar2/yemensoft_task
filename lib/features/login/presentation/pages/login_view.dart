import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
       resizeToAvoidBottomInset: true, 
      body: LoginViewBody(),
    );
  }
}