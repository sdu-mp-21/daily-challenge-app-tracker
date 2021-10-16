import 'package:flutter/material.dart';
import 'feedcreator.dart';
class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
    );
  }
}
