import 'package:challenge_tracker/ui/pages/display_challenges.dart';
import 'package:challenge_tracker/ui/pages/feed/feed_main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class MainPageLogged extends StatefulWidget {
  const MainPageLogged({Key? key}) : super(key: key);


  @override
  PageNavigatorLoggedState createState() => PageNavigatorLoggedState();
}

class PageNavigatorLoggedState extends State<MainPageLogged> {

  int _currentIndex = 0;
  final List _children = [
    const DisplayChallenges(),
    const FeedMainPage()
  ];


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // print(user);
    // print('user name is');
    // print(user);

    return Scaffold(
      drawer: const OurDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/logged_out');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Feed'),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
