class User {
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

  const User({
    this.id,
    this.userId,
    this.rank,
    this.reviewRate,
    required this.interests,
    required this.languages,
    required this.photos,
    required this.bio,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.userType,
    this.priceTag,
    this.location,
    this.paymentMethods,
  });
}
