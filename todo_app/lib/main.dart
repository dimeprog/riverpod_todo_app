import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/views/screens/home.dart';
import 'package:todo_app/views/widgets/color_manager.dart';
import 'package:todo_app/views/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'To-do App',
        debugShowCheckedModeBanner: false,
        theme: getApplicationData(),
        home: const HomeScreen(),
      ),
    );
  }
}
