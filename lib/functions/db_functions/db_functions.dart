import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo_model.dart';

ValueNotifier<List<Todo>> todonotifier = ValueNotifier<List<Todo>>([]);
addTodb(Todo value) async {
  final db = await Hive.openBox<Todo>('Todoos');
  final val = await db.add(value);
  value.id = val;
  getTodoos();
}

getTodoos() async {
  final db = await Hive.openBox<Todo>('Todoos');
  todonotifier.value.clear();
  todonotifier.value.addAll(db.values);
  todonotifier.notifyListeners();
}

editTodb(Todo value, int id) async {
  final db = await Hive.openBox<Todo>('Todoos');
  await db.put(id, value);
  getTodoos();
}

deleteTodb(int id) async {
  final db = await Hive.openBox<Todo>('Todoos');
  await db.delete(id);
  getTodoos();
}
