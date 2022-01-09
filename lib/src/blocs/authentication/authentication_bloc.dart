import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram/src/repositories/token.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage userRepository;
  AuthenticationBloc(this.userRepository)
      : super(AuthenticationInitial()) {
    on<AppLoaded>(
        _appLoaded();
    )
  } 

  /*Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _appLoaded(event);
    } else if(event is UserLoggedIn) {
      yield* _loggedIn(event);
    } else if(event is UserLoggedOut) {
      yield* _loggedOut(event);
    } else if(event is UserDeleted) {
     yield* _userDeleted();
    }
  }*/



  Stream<AuthenticationState> _appLoaded(AuthenticationState event, Emitter<AuthenticationState> emit) async* {
    await _cleanIfFirstUseAfterUninstall();
    yield* _initStartup();
  }

  Stream<AuthenticationState> _initStartup() async* {
    final hasToken = await userRepository.hasToken();

    if(!hasToken) {
      yield AuthenticationNotAuthenticated();
      return;
    }
    yield AuthenticationAuthenticated();
  }

  Stream<AuthenticationState> _loggedIn(UserLoggedIn event) async* {
    yield AuthenticationLoading();
    await userRepository.persistEmailAndToken(event.email, event.token);
    yield* _initStartup();
  }

  Stream<AuthenticationState> _loggedOut(UserLoggedOut event) async* {
    yield AuthenticationLoading();
    await userRepository.deleteToken();
  }

  Stream<AuthenticationState> _userDeleted() async* {
    await userRepository.deleteAll();
    yield AuthenticationNotAuthenticated();
  }

  Future<void> _cleanIfFirstUseAfterUninstall() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      await userRepository.deleteAll();
      await prefs.setBool('first_run', false);
    }
  }
}
