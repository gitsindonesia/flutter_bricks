import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
  );
}