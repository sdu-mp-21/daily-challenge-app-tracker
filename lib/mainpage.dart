import 'package:flutter/material.dart';
import 'feedcreator.dart';
import 'navigators/app_bar.dart';
import 'navigators/bottom_bar.dart';
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
          color: const Color(0xfff1f1f1),
          child: ListView(
            children: const [
              FeedCreator(
                textfield: 'First Feed about something Lorem ips Lorem ipsum asdad ada g qwqhei',
              ),
              FeedCreator(
                textfield: 'Second Feed about something',
              ),
              FeedCreator(
                textfield: 'Third Feed about something',
              ),
              FeedCreator(
                textfield: 'Fourth Feed about something',
              ),
              FeedCreator(
                textfield: 'Fifth Feed about something',
              ),

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
