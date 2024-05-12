import 'package:accompani_bloc/core/error/exceptions.dart';
import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/features/auth/data/data_sources/auth_firebase_data_source.dart';
import 'package:accompani_bloc/core/entities/user.dart';
import 'package:accompani_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebseDataSource firebaseDataSource;
  AuthRepoImpl(this.firebaseDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await firebaseDataSource.getCurrentUserData();

      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return _getUser(() async => await firebaseDataSource
        .createUserWithEmailAndPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, String>> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return _getUser(() async => await firebaseDataSource
        .loginUserWithEmailAndPassword(email: email, password: password));
  }

  Future<Either<Failure, String>> _getUser(
    Future<String> Function() fn,
  ) async {
    try {
      final user = await fn();

      return right(user);
    } on fb.FirebaseAuthException catch (e) {
      return left(Failure(e.message!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
