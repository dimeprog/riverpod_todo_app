import 'package:flutter/material.dart';
import 'package:todo_app/views/widgets/color_manager.dart';
import 'package:todo_app/views/widgets/home_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.slowPrimary,
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
      body: const HomeListView(),
    );
  }
}
