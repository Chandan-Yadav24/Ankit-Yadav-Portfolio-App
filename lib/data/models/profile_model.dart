// lib/data/models/profile_model.dart
class ProfileModel {
  final String name;
  final String tagline;
  final String profileImage;
  final String summary;    // used as profile.summary in AboutScreen
  final String profession; // used as profile.profession
  final String location;   // used as profile.location
  final String? email;
  final String? phone;

  ProfileModel({
    required this.name,
    required this.tagline,
    required this.profileImage,
    required this.summary,
    required this.profession,
    required this.location,
    this.email,
    this.phone,
  });

  String get imagePath => "assets/images/profile.jpg";
}
