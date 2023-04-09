import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Se déconnecter'),
      content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Annuler');
          },
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            // TODO: Insérer le code pour la déconnexion ici
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
