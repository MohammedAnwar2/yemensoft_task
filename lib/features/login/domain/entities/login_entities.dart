import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable {
  String? deliveryName;
  final String? delivryNO;
  final String? password;
  final String? lang;

  LoginEntities({this.deliveryName, this.delivryNO, this.password, this.lang});

  @override
  List<Object?> get props => [delivryNO, password, lang];
}
