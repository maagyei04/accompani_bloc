import 'package:accompani_bloc/core/cubits/app_user/app_user_cubit.dart';
import 'package:accompani_bloc/features/auth/data/data_sources/auth_firebase_data_source.dart';
import 'package:accompani_bloc/features/auth/data/repo/auth_repo_impl.dart';
import 'package:accompani_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/current_user.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/user_login.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/user_sign_up.dart';
import 'package:accompani_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:accompani_bloc/features/profile_process/index_bloc.dart';
import 'package:accompani_bloc/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);

  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  //DataSource
  serviceLocator
    ..registerFactory<AuthFirebseDataSource>(
        () => AuthFirebaseDataSourceImpl(serviceLocator()))
    //Repository
    ..registerFactory<AuthRepo>(() => AuthRepoImpl(serviceLocator()))
    //UseCases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))
    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
