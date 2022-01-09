import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram/src/blocs/authentication/authentication_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationBloc? authenticationBloc;

  SignInBloc({required this.authenticationBloc}) : super(SignInInitial()) {
    assert(authenticationBloc != null);
  }

  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoading();

      //final request = LoginRequest(event.email, event.password);

      try {
        //final response = await UserService().login(request);
        //authenticationBloc!.add(UserLoggedIn(email: response.email, token: response.token));
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}