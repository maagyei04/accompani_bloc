import 'package:accompani_bloc/core/error/exceptions.dart';
import 'package:accompani_bloc/features/profile_process/get_started/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

abstract interface class UserRemoteDataSource {
  fb.User? get currentUserSession;

  Future<UserModel> saveUserInfo(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final fb.FirebaseAuth firebaseClient;
  final _db = FirebaseFirestore.instance;

  UserRemoteDataSourceImpl(this.firebaseClient);

  @override
  fb.User? get currentUserSession => firebaseClient.currentUser!;

  @override
  Future<UserModel> saveUserInfo(UserModel user) async {
    try {
      final userData = await _db
          .collection("Users")
          .doc(currentUserSession?.uid)
          .set(user.toJson());

      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
