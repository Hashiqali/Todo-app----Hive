import 'package:flutter/material.dart';
import 'package:todo_app/functions/db_functions/db_functions.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/snackbar/snackbar.dart';

addTodo(
    {required BuildContext context,
    keyadd,
    required TextEditingController titlecontroller,
    required TextEditingController descriptioncontroller}) async {
  final title = titlecontroller.text;
  final description = descriptioncontroller.text;
  final value = Todo(title: title, description: description);
  if (keyadd.currentState!.validate()) {
    await addTodb(value);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    titlecontroller.text = '';
    descriptioncontroller.text = '';
  } else {
    snakbar(context, 'Please fill the required details');
  }
}

editodo(
    {required BuildContext context,
    required int id,
   required keyupdate,
    required TextEditingController edittitlecontroller,
    required TextEditingController editdescriptioncontroller}) async {
  final title = edittitlecontroller.text;
  final description = editdescriptioncontroller.text;
  final val = Todo(title: title, description: description, id: id);

  if (keyupdate.currentState!.validate()) {
    await editTodb(val, id);
    Navigator.pop(context);
    edittitlecontroller.text = '';
    editdescriptioncontroller.text = '';
  } else {
    snakbar(context, 'Please fill the required details');
  }
}
