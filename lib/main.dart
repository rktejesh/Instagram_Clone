import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/src/app.dart';
import 'package:instagram/src/blocs/authentication/authentication_bloc.dart';
import 'package:instagram/src/repositories/token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocOverrides.runZoned(() {
    runApp(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ));
  },
      blocObserver: SimpleBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(primaryColor: Colors.black),
      home: const App(),
    );
  }
}