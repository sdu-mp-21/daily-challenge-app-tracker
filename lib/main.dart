import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = '21 days Challenge';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: _title,
      home: MainPage(),
    );
  }
}
