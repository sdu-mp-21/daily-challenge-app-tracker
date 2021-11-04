import 'feed_creator.dart';
import 'package:flutter/material.dart';


class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);
  static bool isCreateBtn = false;
  static int count = 0;
  static List<FeedCreator> feeds = [];
  static void addFeed(FeedCreator feed){
    feeds.add(feed);
    ++count;
  }
  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  void _addNewFeeds() {
    setState(() {
      ++FeedMainPage.count;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _feeds = List.generate(
        FeedMainPage.count,
            (int i) => FeedMainPage.feeds[i]);

    return  Container(
      //width: double.infinity,

      color: const Color(0xfff1f1f1),
      child: ListView.builder(
        itemCount: _feeds.length,
        itemBuilder: (context, index) {
          return _feeds[index];
        },

      ),
    );
  }
}