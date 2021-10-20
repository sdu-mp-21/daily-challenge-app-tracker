import 'package:challenge_tracker/navigators/app_bar.dart';
import 'package:challenge_tracker/navigators/bottom_bar.dart';
import 'package:challenge_tracker/ui/pages/feed/feed_creator.dart';
import 'package:challenge_tracker/ui/pages/feed/text_field.dart';
import 'package:flutter/material.dart';
class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
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
                textField: 'First Feed about something Lorem ips Lorem ipsum asdad ada g qwqhei',
              ),
              FeedCreator(
                textField: 'Second Feed about something',
              ),
              FeedCreator(
                textField: 'Third Feed about something',
              ),
              FeedCreator(
                textField: 'Fourth Feed about something',
              ),
              FeedCreator(
                textField: 'Fifth Feed about something',
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
      bottomNavigationBar: GeneralBottomBar(false, true),
    );
  }
}