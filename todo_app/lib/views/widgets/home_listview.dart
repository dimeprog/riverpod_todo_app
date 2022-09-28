import 'package:flutter/material.dart';

import 'package:todo_app/views/widgets/color_manager.dart';

import '../../models/todo.dart';
import 'package:intl/intl.dart';

class HomeListView extends StatelessWidget {
  final List<Todo> todoList;
  const HomeListView({
    super.key,
    required this.todoList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TodoItem(
        todo: todoList[index],
      ),
      itemCount: todoList.length,
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorManager.deepPrimary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              blurRadius: 0.2, offset: Offset(3, 4), color: Colors.black12)
        ],
      ),
      child: Center(
        child: ListTile(
          leading: Text(
            DateFormat('kk:mm a').format(todo.createdAt!),
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Checkbox(
            onChanged: (val) {},
            value: todo.isDone ?? false,
            checkColor: Colors.white,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                todo.task!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                DateFormat('dd/mm/yyyy').format(todo.createdAt!),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
