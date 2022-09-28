import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/services/remote/api_call.dart';

import '../../models/todo.dart';

class TodoRepository {
  ApiCall apiCall = ApiCall();
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<List<Todo>> fetchTodos() async {
    final data = await apiCall.getData('/todos');
    if (data == null) {
      return [];
    } else {
      final todoList =
          (data as List<dynamic>).map((e) => Todo.fromJson(e)).toList();
      _todos = todoList;
      return _todos;
    }
  }
}

// provider repos
final todoRepositoryProvider = Provider((ref) => TodoRepository());
