
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yemensoft_task/core/api/api_consumer.dart';
import 'package:yemensoft_task/core/api/dio_consumer.dart';
import 'package:yemensoft_task/features/login/data/datasources/auth_remote_datasources.dart';
import 'package:yemensoft_task/features/login/data/repositories/auth_repo_imp.dart';
import 'package:yemensoft_task/features/login/domain/usecases/login_usecase.dart';
import 'package:yemensoft_task/features/login/presentation/bloc/login_cubit/login_cubit.dart';
part 'get_it.dart';