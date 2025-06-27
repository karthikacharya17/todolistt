import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/task_view_model.dart';
import 'views/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
