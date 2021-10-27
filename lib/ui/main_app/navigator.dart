import 'package:challenge_tracker/ui/pages/feed/feed_main_page.dart';
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
    const Center(
      child: Text('I am here'),
    ),
    const FeedMainPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const OurDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: _children[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: () {
          _currentIndex == 0 ? Navigator.pushNamed(context, '/createChallenge'):Navigator.pushNamed(context, '/createPost');

        },
        child: const Icon(Icons.add),
      ),
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
