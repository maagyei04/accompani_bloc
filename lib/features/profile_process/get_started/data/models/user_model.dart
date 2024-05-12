import 'package:accompani_bloc/core/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.userId,
      required super.rank,
      required super.reviewRate,
      required super.interests,
      required super.languages,
      required super.photos,
      required super.bio,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.password,
      required super.userType,
      required super.priceTag,
      required super.location,
      required super.paymentMethods});

  toJson() {
    return {
      "UserId": firebase.FirebaseAuth.instance.currentUser!.uid,
      "UserType": 'Guest',
      "Rank": '0.0',
      "ReviewRate": '0.0',
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phoneNumber,
      "Bio": bio,
      "Password": password,
      "Interests": List<String>.from(interests),
      "Languages": List<String>.from(languages),
      "Photos": List<String>.from(photos),
      "PriceTag": priceTag,
      "Location": location,
      "PaymentMethods": List<String>.from(paymentMethods),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map["UserId"] ?? 'Default...',
      userType: map["UserType"] ?? 'Default...',
      userId: map["UserId"] ?? 'Default...',
      firstName: map["FirstName"] ?? 'Default...',
      lastName: map["LastName"] ?? 'Default...',
      email: map["Email"] ?? 'Default...',
      phoneNumber: map["Phone"] ?? 'Default...',
      bio: map["Bio"] ?? 'Default...',
      reviewRate: map["ReviewRate"] ?? 'Default...',
      rank: map["Rank"] ?? 'Default...',
      interests: List<String>.from(map["Interests"] ??
          [
            'Default...',
            'Default...',
          ]),
      languages: List<String>.from(map["Languages"] ??
          [
            'Default...',
            'Default...',
          ]),
      photos: List<String>.from(map["Photos"] ??
          [
            'Default...',
            'Default...',
          ]),
      password: 'Default..',
      priceTag: map["PriceTag"] ?? 'Default..',
      location: map["Location"] ?? 'Default...',
      paymentMethods: List<String>.from(map["PaymentMethods"] ??
          [
            'Default...',
            'Default...',
          ]),
    );
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return UserModel(
      id: document.id,
      userType: data?["UserType"] ?? 'Default...',
      userId: data?["UserId"] ?? 'Default...',
      firstName: data?["FirstName"] ?? 'Default...',
      lastName: data?["LastName"] ?? 'Default...',
      email: data?["Email"] ?? 'Default...',
      phoneNumber: data?["Phone"] ?? 'Default...',
      bio: data?["Bio"] ?? 'Default...',
      reviewRate: data?["ReviewRate"] ?? 'Default...',
      rank: data?["Rank"] ?? 'Default...',
      interests: List<String>.from(data?["Interests"] ??
          [
            'Default...',
            'Default...',
          ]),
      languages: List<String>.from(data?["Languages"] ??
          [
            'Default...',
            'Default...',
          ]),
      photos: List<String>.from(data?["Photos"] ??
          [
            'Default...',
            'Default...',
          ]),
      password: 'Default..',
      priceTag: data?["PriceTag"] ?? 'Default..',
      location: data?["Location"] ?? 'Default...',
      paymentMethods: List<String>.from(data?["PaymentMethods"] ??
          [
            'Default...',
            'Default...',
          ]),
    );
  }
}
