import 'package:challenge_tracker/ui/pages/display_challenges.dart';
import 'package:challenge_tracker/ui/pages/feed/feed_main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  PageNavigatorState createState() => PageNavigatorState();
}

class PageNavigatorState extends State<MainPage> {
  
  int _currentIndex = 0;
  final List _children = [
    const DisplayChallenges(),
    const FeedMainPage()
  ];


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    bool isLogged = user == null ? false : true;
    // final provider = Provider.of<EmailSignInProvider>(context);
    // print('username is');
    // // print(provider.userEmail);
    //
    // print(user);
    return Scaffold(
      drawer: OurDrawer(),
      appBar: !isLogged ? AppBar(
        backgroundColor: Colors.orange.shade300,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              icon: const Icon(Icons.account_circle))
        ],
      ) : AppBar(
        backgroundColor: Colors.orange.shade300,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                setState(() {
                  isLogged = false;
                });
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
