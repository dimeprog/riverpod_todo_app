import 'dart:convert';

class Todo {
  Todo({
    this.createdAt,
    this.task,
    this.isDone = false,
    this.id,
  });

  DateTime? createdAt;
  String? task;
  bool? isDone;
  String? id;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        createdAt: DateTime.parse(json["createdAt"]),
        task: json["task"],
        isDone: json["isDone"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "task": task,
        "isDone": isDone,
        "id": id,
      };

  Todo copyWith({
    DateTime? createdAt,
    String? task,
    bool? isDone,
    String? id,
  }) =>
      Todo(
        createdAt: createdAt ?? this.createdAt,
        task: task ?? this.task,
        isDone: isDone ?? this.isDone,
        id: id ?? this.id,
      );
}
