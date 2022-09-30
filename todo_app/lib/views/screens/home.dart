import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/views/widgets/color_manager.dart';
import 'package:todo_app/views/widgets/home_listview.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(todoProvider);
    return Scaffold(
      backgroundColor: ColorManager.lightYellow,
      appBar: AppBar(
        backgroundColor: ColorManager.deepPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ToDo App',
          style: TextStyle(
            color: ColorManager.iconColor,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: data.when(
          data: (data) {
            if (data.isNotEmpty) {
              return HomeListView(
                todoList: data,
              );
            } else {
              return const Center(
                child: Text('No tasks added yet'),
              );
            }
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
      floatingActionButton: const AddTasksButton(),
    );
  }
}

class AddTasksButton extends ConsumerStatefulWidget {
  const AddTasksButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddTasksButton> createState() => _AddTasksButtonState();
}

class _AddTasksButtonState extends ConsumerState<AddTasksButton> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Center(child: Text('Add New Tasks')),
            content: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
