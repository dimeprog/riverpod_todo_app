import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/repos/todo_repo.dart';

// todoprovider for loading todos from server
final todoProvider = FutureProvider<List<Todo>>((ref) async {
  return ref.watch(todoRepositoryProvider).fetchTodos();
});


// ischecked provider
// final 