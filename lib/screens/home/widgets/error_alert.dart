

import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget{

  final state;

  const ErrorAlert({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("${state.error}"));
  }

}