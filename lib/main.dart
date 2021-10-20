import 'package:flutter/material.dart';
import 'main_page.dart';
import 'Daryn/main_page.dart';
import 'marlen/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = '21 days Challenge';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/second': (context) => const Mainpage(),
        '/third': (context) => SplashPage(),
      },
    );
  }
}
