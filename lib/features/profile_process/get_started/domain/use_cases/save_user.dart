import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/core/use_case/use_case.dart';
import 'package:accompani_bloc/features/profile_process/get_started/domain/entities/user.dart';
import 'package:accompani_bloc/features/profile_process/get_started/domain/repo/user_repo.dart';
import 'package:fpdart/fpdart.dart';

class SaveUser implements UseCase<User, SaveUserParams> {
  final UserRepository userRepository;
  SaveUser(this.userRepository);

  @override
  Future<Either<Failure, User>> call(SaveUserParams params) async {
    return await userRepository.saveUserInfo(
        id: params.id,
        userId: params.userId,
        interests: params.interests,
        languages: params.languages,
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        phoneNumber: params.phoneNumber,
        photos: params.photos,
        bio: params.bio,
        password: params.password,
        userType: params.userType,
        priceTag: params.priceTag,
        location: params.location,
        rank: params.rank,
        reviewRate: params.reviewRate,
        paymentMethods: params.paymentMethods);
  }
}

class SaveUserParams {
  final String? id;
  final String? userId;
  final List<String> interests;
  final List<String> languages;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<String> photos;
  final String bio;
  final String password;
  final String? userType;
  final String? priceTag;
  final String? location;
  final String? rank;
  final String? reviewRate;
  final List<String>? paymentMethods;
  SaveUserParams({
    this.id,
    this.userId,
    required this.interests,
    required this.languages,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.photos,
    required this.bio,
    required this.password,
    this.userType,
    this.priceTag,
    this.location,
    this.rank,
    this.reviewRate,
    this.paymentMethods,
  });
}
