import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/sub_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOLIST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'TODOLIST'),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(title: 'TODOLIST'),
        SubScreen.routeName: (ctx) => const SubScreen(),
      },
    );
  }
}
