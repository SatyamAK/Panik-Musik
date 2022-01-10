import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panik_musik/components/dialogbox.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //register emailpassword
  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      return user;
    } on FirebaseException catch (e) {
      showAlertDialog(context, e.message.toString());
    }
  }

  //logout
  Future logout() async {
    await _auth.signOut();
  }

  //login using email and pass
  Future<User?> loginUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;
      return user;
    } on FirebaseException catch (e) {
      showAlertDialog(context, e.message.toString());
    }
  }

  //sigin using google
  Future<User?> loginUsingGoogle(BuildContext context) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await account!.authentication;
      OAuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(googleCredential);
      User user = userCredential.user!;
      return user;
    } on FirebaseException catch (e) {
      showAlertDialog(context, e.message.toString());
    } catch (e) {
      showAlertDialog(context, 'Something Went Wrong');
    }
  }
}
