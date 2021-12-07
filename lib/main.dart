import 'package:flutter/material.dart';
import './screens/sub_screen.dart';
import './screens/home_screen.dart';
import './screens/category_screen.dart';
import './screens/write_todo_screen.dart';

import './helpers/theme.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // firebase init
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOLIST',
      theme: getThemeData(),
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(title: 'hi'),
            );
          case SubScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => SubScreen(),
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
