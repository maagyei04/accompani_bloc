import 'package:accompani_bloc/core/error/failure.dart';
import 'package:accompani_bloc/features/profile_process/get_started/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserRepository {
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
  });
}
