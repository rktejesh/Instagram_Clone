part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInButtonPressed extends SignInEvent {
  final String email;
  final String password;

  const SignInButtonPressed({
    required this.email,
    required this.password
});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginButtonPressed { username: $email, password: $password }';

}