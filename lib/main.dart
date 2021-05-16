import 'package:flutter/material.dart';
import 'package:panik_musik/bottomnavbar.dart';
import 'package:panik_musik/constants/theme.dart';
import 'package:panik_musik/screens/login/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: Wrapper()
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }
}
