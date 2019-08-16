import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bricks/blocs/auth/auth_bloc.dart';
import 'package:flutter_bricks/blocs/auth/bloc.dart';
import 'package:flutter_bricks/repositories/user_repository.dart';
import 'package:flutter_bricks/screens/home/home_screen.dart';
import 'package:flutter_bricks/screens/loading/loading_screen.dart';
import 'package:flutter_bricks/screens/login/login_screen.dart';
import 'package:flutter_bricks/screens/splash/splash_screen.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..dispatch(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) return SplashScreen();
          if (state is AuthenticationAuthenticated) return HomeScreen();
          if (state is AuthenticationLoading) return LoadingScreen();
          if (state is AuthenticationUnauthenticated)
            return LoginScreen(userRepository: userRepository);
          return Scaffold();
        },
      ),
    );
  }
}