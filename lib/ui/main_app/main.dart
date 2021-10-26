import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/pages/auth/login_widget.dart';
import 'package:challenge_tracker/ui/pages/auth/privacy_policy.dart';
import './navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static const String _title = '21 days Challenge';

  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/register': (context) =>  const Authorization(),
        '/login': (context) => const LoginPage(),
        '/privacyPolicy': (context) => PrivacyPolicy(),
      },
    );
  }
}

