import 'package:flutter/material.dart';
import 'package:panik_musik/services/authService.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          AuthService().logout();
        },
        child: Text('Logout'),
      ),
    );
  }
}