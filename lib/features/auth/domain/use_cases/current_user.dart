import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/core/use_case/use_case.dart';
import 'package:accompani_bloc/core/entities/user.dart';
import 'package:accompani_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepo authRepo;
  CurrentUser(this.authRepo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepo.currentUser();
  }
}
