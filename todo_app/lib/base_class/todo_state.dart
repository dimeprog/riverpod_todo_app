import 'package:todo_app/providers/repos/todo_repo.dart';

abstract class TodoState {
  const TodoState();
}

class TodoActive extends TodoState {
  const TodoActive();
}

class TodoactiveError extends TodoState {
  const TodoactiveError();
}

class TodoInactive extends TodoState {
  const TodoInactive();
}
