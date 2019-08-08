import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bricks/blocs/login/login_bloc.dart';
import 'package:flutter_bricks/screens/login/extensions/login_form_ext.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginFormExt {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: loginBloc,
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: passwordController,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: state is! LoginLoading ? onLoginButtonPressed : null,
                child: Text('Login'),
              ),
              Container(
                child: state is LoginLoading
                    ? CircularProgressIndicator()
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}