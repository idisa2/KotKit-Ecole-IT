import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profil/components/edit_profil_screen.dart';
import 'package:flutter_auth/Screens/Profil/components/delete_acount_dialog.dart';
import 'package:flutter_auth/Screens/Profil/components/logout_dialog.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Edit profile"),
          value: "edit_profile",
        ),
        PopupMenuItem(
          child: Text("Logout"),
          value: "logout",
        ),
        PopupMenuItem(
          child: Text("Delete account"),
          value: "delete_account",
        ),
      ],
      onSelected: (value) async {
        switch (value) {
          case "edit_profile":
            await showDialog(
              context: context,
              builder: (context) => const EditProfileScreen(),
            );
            break;
          case "logout":
            await showDialog(
              context: context,
              builder: (context) => const LogoutDialog(),
            );
            break;
          case "delete_account":
            await showDialog(
              context: context,
              builder: (context) => DeleteAcount(),
            );
            break;
        }
      },
    );
  }
}
