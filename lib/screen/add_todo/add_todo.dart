import 'package:flutter/material.dart';
import 'package:todo_app/functions/functions.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  GlobalKey addkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Todo',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: addkey,
        child: ListView(padding: const EdgeInsets.all(20), children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please add Title';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titlecontroller,
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
            controller: descriptioncontroller,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                addTodo(
                    context: context,
                    keyadd: addkey,
                    titlecontroller: titlecontroller,
                    descriptioncontroller: descriptioncontroller);
              },
              child: const Text('Submit')),
        ]),
      ),
    );
  }
}
