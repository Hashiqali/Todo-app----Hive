import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screen/add_todo/add_todo.dart';
import 'package:todo_app/screen/drawer/drawer.dart';
import 'package:todo_app/functions/db_functions/db_functions.dart';
import 'package:todo_app/screen/edit_todo/edit_todo.dart';
import 'package:todo_app/widgets/delete_dialogue/delete_dialogue.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  void initState() {
    getTodoos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return getTodoos();
      },
      child: Scaffold(
        drawer: const DrawerWidget(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddTodo();
              }));
            },
            backgroundColor: const Color.fromARGB(255, 64, 64, 64),
            child: const Text('Add')),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 47, 47, 47),
          centerTitle: true,
          title: const Text(
            'Todoos',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: todonotifier,
            builder: (ctx, items, child) {
              final values = items.toList();
              if (values.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              }
              return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (ctx, index) {
                    Todo data = values[index];

                    return Card(
                      color: const Color.fromARGB(221, 51, 51, 51),
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 11, 11, 11),
                            child: Text((index + 1).toString())),
                        title: Text(data.title),
                        subtitle: Text(data.description),
                        trailing: PopupMenuButton(onSelected: (value) {
                          if (value == 'edit') {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Edittodo(todo: data);
                            }));
                          } else if (value == 'delete') {
                            alertdialogue(context, data.id!);
                          }
                        }, itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        }),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
