import 'package:equatable/equatable.dart';
import 'package:instagram/src/models/user.dart';

class UserProfile{
  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImage
  });
  final String id;
  final String name;
  final String email;
  final String firstName;
  final String lastName;
  final String profileImage;

  factory UserProfile.fromJson(Map<String, dynamic> parsedJson) {
    return UserProfile(
        id: parsedJson['_id'] as String,
        name: parsedJson['username'] as String,
        email: parsedJson['email'] as String,
        firstName: ['firstName'] as String,
        lastName: ['lastName'] as String,
        profileImage: ['profileImage'] as String
    );
  }
}