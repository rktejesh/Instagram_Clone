import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/blocs/authentication/authentication_bloc.dart';
import 'package:instagram/src/blocs/signIn/sign_in_bloc.dart';
import 'package:instagram/src/repositories/token.dart';

import 'login_form.dart';


class LoginPage extends StatelessWidget {
  final SecureStorage? userRepository;

  const LoginPage({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login | Home Hub'),
      ),
      body: BlocProvider(
        create: (context) {
          return SignInBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: const LoginForm(),
      ),
    );
  }
}
