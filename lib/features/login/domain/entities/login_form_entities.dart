import 'package:flutter/material.dart';

class LoginFormEntities {
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  initState() {
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  dispose() {
    userIdController.dispose();
    passwordController.dispose();
  }
}
