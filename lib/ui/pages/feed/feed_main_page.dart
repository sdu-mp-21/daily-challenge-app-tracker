import 'package:challenge_tracker/ui/pages/feed/feed_creator.dart';
import 'package:flutter/material.dart';
class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
        );
  }
}