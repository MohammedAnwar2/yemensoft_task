import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemensoft_task/core/services/shared_pref.dart';
import 'package:yemensoft_task/features/login/presentation/pages/login_view.dart';

class SessionManager {
  Timer? _timer;

  void startSessionTimer(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(Duration(minutes: 2), () {
      _logout(context);
    });
  }

  void resetSessionTimer(BuildContext context) {
    startSessionTimer(context);
  }

  void _logout(BuildContext context) {
    SharedPref.clear();
    GoRouter.of(context).go(LoginView.routeName);
  }

  void dispose() {
    _timer?.cancel();
  }
}