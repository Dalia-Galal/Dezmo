import 'package:e_commerceapp/core/network_handler/api_network_interface.dart';
import 'package:e_commerceapp/core/network_handler/dio_api_client.dart';
import 'package:e_commerceapp/core/storage/token_storage.dart';
import 'package:e_commerceapp/modules/auth/data/data_sources/auth_data_source.dart';
import 'package:e_commerceapp/modules/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:e_commerceapp/modules/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:e_commerceapp/modules/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_in/sign_in_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // core
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => TokenStorage(getIt()));
  getIt.registerLazySingleton<ApiNetworkInterface>(() => DioApiClient(getIt()));

  // data
  getIt.registerLazySingleton<AuthDataSource>(
        () => RemoteAuthDataSource(getIt<ApiNetworkInterface>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(getIt(), getIt()),
  );

  // domain
  getIt.registerLazySingleton(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));

  // presentation
  getIt.registerFactory(() => SignInBloc(getIt()));
  getIt.registerFactory(() => SignUpBloc(getIt()));
  getIt.registerFactory(() =>ForgetPasswordBloc(getIt()));


}
