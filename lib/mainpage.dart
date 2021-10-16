import 'package:flutter/material.dart';
import 'feedcreator.dart';
import 'parasat/app_bar.dart';
import 'parasat/bottom_bar.dart';
class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 2.0,
          ),
          color: const Color(0xff0F0F13),
          child: ListView(
            children: const [
              FeedCreator(),
              FeedCreator(),
              FeedCreator(),
              FeedCreator(),
              FeedCreator(),
              FeedCreator(),
            ],
          ),
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: const FloatingActionButton(
    tooltip: "Centre FAB",
    onPressed: null,
    child: Icon(Icons.add),
    ),
      bottomNavigationBar: const GeneralBottomBar(),
    );
  }
}
