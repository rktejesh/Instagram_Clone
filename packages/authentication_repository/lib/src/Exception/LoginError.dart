
class LogInFailure implements Exception {
  const LogInFailure([
    this.message = 'An unknown exception occurred.',
  ]);
  factory LogInFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInFailure();
    }
  }
  final String message;
}