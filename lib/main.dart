import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/category_screen.dart';
import './screens/write_todo_screen.dart';

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
      initialRoute: HomeScreen.routeName,
      // routes: {
      //   HomeScreen.routeName: (ctx) => const HomeScreen(title: 'TODOLIST'),
      //   CategoryScreen.routeName: (ctx) =>
      //       CategoryScreen(id: 'hi', title: 'hi'),
      //   WriteTodoScreen.routeName: (ctx) => WriteTodoScreen(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(title: 'hi'),
            );
          case CategoryScreen.routeName:
            final _cate_arg = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(
              builder: (context) => CategoryScreen(
                id: _cate_arg['id'],
                title: _cate_arg['title'],
              ),
            );
          case WriteTodoScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => WriteTodoScreen(),
            );
        }
      },
    );
  }
}
