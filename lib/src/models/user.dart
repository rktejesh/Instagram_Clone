class User {
  final String userId;
  final String username;
  /*final String firstName;
  final String email;
  final String lastName;*/
  final String profileImageUrl;

  const User({
    required this.userId,
    required this.username,
    required this.profileImageUrl,
    /*required this.firstName,
    required this.lastName,
    required this.email*/
  });

  factory User.fromDatabaseJson(Map<String, dynamic> data) => const User(
    profileImageUrl: '',
    username: 'username',
    userId: '_id',
  );
}