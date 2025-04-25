import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable {
  final String? delivryNO;
  final String? password;
  final String? lang;

  const LoginEntities({
    this.delivryNO,
    this.password,
    this.lang,  
  });

  @override
  List<Object?> get props => [delivryNO, password, lang];
}