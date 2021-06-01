import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/bottomnavbar.dart';
import 'package:panik_musik/constants/theme.dart';
import 'package:panik_musik/screens/login/loginscreen.dart';
import 'package:panik_musik/services/authService.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: AuthService().firebaseAuth.authStateChanges(),
      child: MaterialApp(
        title: 'Panik Musik',
        theme: lightTheme(),
        home: Wrapper()
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    if(user==null){
      return LoginScreen();
    }
    return BottomNavBar();
  }
}
