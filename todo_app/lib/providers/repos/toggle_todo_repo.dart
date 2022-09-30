import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todo_app/base_class/todo_state.dart';
import 'package:todo_app/services/remote/api_call.dart';

class ToggleTodoRepository extends StateNotifier<TodoState> {
  ToggleTodoRepository() : super(TodoInactive());
  // ignore: empty_constructor_bodies
  ApiCall apiCall = ApiCall();

  Future<TodoState> postToggleValue(
    String? id, {
    bool isDone = false,
  }) async {
    try {
      state = TodoInactive();
      final data = await apiCall.putData('/todos/$id', {
        'isDone': isDone,
      });
      print(data);
      if (data == null) {
        Get.snackbar('Error', 'check failed to send');
        state = TodoInactive();
      } else {
        Get.snackbar(
          'Success',
          'check completed ',
          backgroundColor: Colors.white54,
          colorText: Colors.black38,
        );
        state = TodoActive();
      }
    } catch (err) {
      // print(err.toString());
      state = TodoactiveError();
    }
    return state;
  }
}

final toggleRepositoryProvider =
    StateNotifierProvider<ToggleTodoRepository, TodoState>(
  (ref) => ToggleTodoRepository(),
);
