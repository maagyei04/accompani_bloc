import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/core/use_case/use_case.dart';
import 'package:accompani_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepo authRepo;
  UserSignUp(this.authRepo);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepo.createUserWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;

  UserSignUpParams({required this.email, required this.password});
}
