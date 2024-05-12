import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/core/use_case/use_case.dart';
import 'package:accompani_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<String, UserLoginParams> {
  final AuthRepo authRepo;
  UserLogin(this.authRepo);

  @override
  Future<Either<Failure, String>> call(UserLoginParams params) async {
    return await authRepo.loginUserWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
