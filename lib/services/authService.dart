import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/main.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future login(String email, String password, BuildContext context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        showAlertDialog(context, 'User Not Found', false);
      } else if (err.code == 'wrong-password') {
        showAlertDialog(context, 'Invalid Password', false);
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future register(String email, String password, BuildContext context) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      showAlertDialog(context, 'Registeration Successfully', true);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        showAlertDialog(context, 'Password is too weak', false);
      } else if (err.code == 'email-already-in-use') {
        showAlertDialog(context, 'User Already exists with the email', false);
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  showAlertDialog(BuildContext context, String message, bool issucc) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (issucc) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Wrapper()), (route) => false);
        }
        else Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
