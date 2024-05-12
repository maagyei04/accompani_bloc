import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/core/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
