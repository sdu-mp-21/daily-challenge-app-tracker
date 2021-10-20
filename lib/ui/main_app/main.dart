import 'package:challenge_tracker/navigators/app_bar.dart';
import 'package:challenge_tracker/navigators/bottom_bar.dart';
import 'package:challenge_tracker/ui/pages/feed/feed_main_page.dart';
import 'package:flutter/material.dart';
import '../pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

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
        '/second': (context) => const FeedMainPage(),
        '/third': (context) => const SplashPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: GeneralBottomBar(true, false),
    );
  }
}
