import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/blocs/signIn/sign_in_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<SignInBloc>(context).add(SignInButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ));
    }
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if(state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('$state.error'),
          ));
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Username',
                          icon: Icon(Icons.person)
                      ),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.security)
                      ),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    ElevatedButton(
                      onPressed: state is! SignInLoading ? _onLoginButtonPressed: null,
                      child: const Text(
                          'Login'
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Username',
                    icon: Icon(Icons.person)
                ),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.security)
                ),
                controller: _passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: (){},
                child: const Text(
                    'Login'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/