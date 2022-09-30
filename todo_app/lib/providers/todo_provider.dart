import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/base_class/todo_state.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/repos/todo_repo.dart';
import 'package:todo_app/providers/repos/toggle_todo_repo.dart';

// todoprovider for loading todos from server
final todoProvider = FutureProvider<List<Todo>>((ref) async {
  return ref.watch(todoRepositoryProvider).fetchTodos();
});
// todoprovider for send checkbox boolean value
// final checkBoxProvider = FutureProvider<TodoState>((ref) async {
//   return ref.watch(toggleRepositoryProvider.notifier).postToggleValue(id);
// });

// ischecked provider
// final 