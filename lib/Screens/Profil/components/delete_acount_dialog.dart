import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DeleteAcount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Supprimer le compte'),
      content: const Text('Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('ANNULER'),
        ),
        TextButton(
          onPressed: () {
            // Ajouter ici le code pour supprimer le compte
            Navigator.of(context).pop(true);
          },
          child:const Text('SUPPRIMER'),
        ),
      ],
    );
  }
}
