import 'package:flutter/material.dart';
import 'package:todo_app/functions/functions.dart';
import 'package:todo_app/model/todo_model.dart';

class Edittodo extends StatefulWidget {
  const Edittodo({super.key, required this.todo});
  final Todo todo;
  @override
  State<Edittodo> createState() => _EdittodoState();
}

class _EdittodoState extends State<Edittodo> {
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
    final size = MediaQuery.of(context).size;
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
          SizedBox(
            height: size.height / 100,
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
          SizedBox(
            height: size.height / 25,
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
