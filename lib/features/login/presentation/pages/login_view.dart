import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/services/get_it/get_it_imports.dart';
import 'package:yemensoft_task/features/login/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:yemensoft_task/features/login/presentation/widgets/login_view_body_bloc_builder.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
