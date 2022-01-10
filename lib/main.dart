import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/src/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_logs/flutter_logs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
    ],
    directoryStructure: DirectoryStructure.FOR_DATE,
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    logFileExtension: LogFileExtension.LOG,
    logsWriteDirectoryName: "Logs",
    logsExportDirectoryName: "Logs/Exported",
    logTypesEnabled: ["errors", "bloc"],
  );

  BlocOverrides.runZoned(() {
    runApp(
      App(
        authenticationRepository: AuthenticationRepository(),
        userRepository: UserRepository(),
      ),
    );
  }, blocObserver: SimpleBlocObserver());
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    FlutterLogs.logToFile(
      logFileName: "bloc",overwrite: false,
      logMessage: event.toString()
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    FlutterLogs.logToFile(
        logFileName: "bloc",overwrite: false,
        logMessage: transition.toString()
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    FlutterLogs.logToFile(
        logFileName: "bloc",overwrite: false,
        logMessage: change.toString()
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    FlutterLogs.logToFile(
        logFileName: "errors",overwrite: false,
        logMessage: error.toString()
    );
    super.onError(bloc, error, stackTrace);
  }
}
