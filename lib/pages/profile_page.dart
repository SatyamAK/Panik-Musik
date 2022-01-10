import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panik_musik/components/buttons.dart';
import 'package:panik_musik/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: button(Theme.of(context).primaryColor, 'Logout',
          FontAwesomeIcons.signOutAlt, logout, context),
    );
  }

  void logout() async {
    await AuthService().logout();
  }
}
