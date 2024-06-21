import 'package:flutter/material.dart';
import 'package:todo_app/functions/db_functions/db_functions.dart';

alertdialogue(context, int id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('You want to delete?'),
          actions: [
            TextButton(
                onPressed: () async {
                  await deleteTodb(id);
                  Navigator.of(context).pop();
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}
