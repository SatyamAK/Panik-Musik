import 'package:flutter/material.dart';
import 'package:panik_musik/components/bottom_navigationbar.dart';
import 'package:panik_musik/pages/login_page.dart';
import 'package:panik_musik/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}