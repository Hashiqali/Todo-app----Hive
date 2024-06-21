import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title = '';
  @HiveField(2)
  String description = '';
  Todo({required this.title, required this.description, this.id});
}
