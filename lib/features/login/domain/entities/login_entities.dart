import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable {
  final String? userId;
  final String? password;
  final String? lang;

  const LoginEntities({
    this.userId,
    this.password,
    this.lang,  
  });

  @override
  List<Object?> get props => [userId, password, lang];
}