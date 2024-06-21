import 'package:flutter/material.dart';
import 'package:todo_app/functions/db_functions/db_functions.dart';
import 'package:todo_app/functions/functions.dart';

import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/snackbar/snackbar.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key, required this.todo});
  final Todo todo;
  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  @override
  void initState() {
    editdescriptioncontroller.text = widget.todo.description;
    edittitlecontroller.text = widget.todo.title;
    super.initState();
  }

  TextEditingController edittitlecontroller = TextEditingController();
  TextEditingController editdescriptioncontroller = TextEditingController();
  GlobalKey keyupdate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Todo',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: keyupdate,
        child: ListView(padding: const EdgeInsets.all(20), children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please add Title';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Title'),
            controller: edittitlecontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please add Description';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
            controller: editdescriptioncontroller,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                editodo(
                    keyupdate: keyupdate,
                    context: context,
                    id: widget.todo.id!,
                    edittitlecontroller: edittitlecontroller,
                    editdescriptioncontroller: editdescriptioncontroller);
              },
              child: const Text('Submit')),
        ]),
      ),
    );
  }
}
