import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bricks/blocs/login/login_bloc.dart';


@optionalTypeArgs
mixin LoginFormExt<T extends StatefulWidget> on State<T> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginBloc loginBloc;

  void onLoginButtonPressed() {
    loginBloc.dispatch(LoginButtonPressed(
      username: usernameController.text,
      password: passwordController.text,
    ));
  }

  void blocListener(){
    loginBloc.state.listen((state){
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }
}