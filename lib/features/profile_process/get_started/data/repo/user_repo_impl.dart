import 'package:accompani_bloc/core/error/exceptions.dart';
import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/features/profile_process/get_started/data/data_sources/user_remote_data_source.dart';
import 'package:accompani_bloc/features/profile_process/get_started/data/models/user_model.dart';
import 'package:accompani_bloc/features/profile_process/get_started/domain/entities/user.dart';
import 'package:accompani_bloc/features/profile_process/get_started/domain/repo/user_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserRepoImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepoImpl(this.userRemoteDataSource);

  @override
  Future<Either<Failure, User>> saveUserInfo({
    required String? id,
    required String? userId,
    required List<String> interests,
    required List<String> languages,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required List<String> photos,
    required String bio,
    required String password,
    required String? userType,
    required String? priceTag,
    required String? location,
    required String? rank,
    required String? reviewRate,
    required List<String>? paymentMethods,
  }) async {
    try {
      UserModel userModel = UserModel(
          id: id!,
          userId: userId!,
          rank: rank!,
          reviewRate: reviewRate!,
          interests: interests,
          languages: languages,
          photos: photos,
          bio: bio,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          userType: userType!,
          priceTag: priceTag!,
          location: location!,
          paymentMethods: paymentMethods!);

      final savedUser = await userRemoteDataSource.saveUserInfo(userModel);
      return right(savedUser as User);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
