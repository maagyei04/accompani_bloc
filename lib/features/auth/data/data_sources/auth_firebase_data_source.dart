import 'package:accompani_bloc/core/entities/user.dart';
import 'package:accompani_bloc/core/error/exceptions.dart';
import 'package:accompani_bloc/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

abstract interface class AuthFirebseDataSource {
  fb.User? get currentUserSession;

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthFirebaseDataSourceImpl implements AuthFirebseDataSource {
  final fb.FirebaseAuth firebaseClient;
  final _db = FirebaseFirestore.instance;

  AuthFirebaseDataSourceImpl(this.firebaseClient);

  @override
  fb.User? get currentUserSession => firebaseClient.currentUser!;

  @override
  Future<String> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await firebaseClient.signInWithEmailAndPassword(
          email: email, password: password);
      //
      if (response.user == null) {
        throw const ServerException('User is null!');
      }

      return response.user!.uid;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await firebaseClient.createUserWithEmailAndPassword(
          email: email, password: password);
      //
      if (response.user == null) {
        throw const ServerException('User is null!');
      }

      return response.user!.uid;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final snapshot = await _db
            .collection("Users")
            .where("UserId", isEqualTo: currentUserSession!.uid)
            .get();

        final userInfo =
            snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
        return userInfo;
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
