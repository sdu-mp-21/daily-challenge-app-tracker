import 'feed_creator.dart';
import 'status_creator_page.dart';
import 'package:flutter/material.dart';

class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);
  static int count = 0;
  static List<FeedCreator> feeds = [];


  // * Add new Feed
  // !  FIXME: update doesn't work, because can't use setState method with static method
  static void addFeed(FeedCreator feed) {
    feeds.add(feed);
    ++count;
  }
// * Delete Feed
  // !  FIXME: update doesn't work, because can't use setState method with static method
  static void removeFeed(FeedCreator feed) {
    feeds.remove(feed);
    --count;
  }
  // ! edit btn
  static void editFeed(FeedCreator feed){
    Navigator.push(
        feed.context,
      MaterialPageRoute(
        builder: (context) => const StatusCreator(),
      ),
    );
    print("sad");
  }

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  @override
  Widget build(BuildContext context) {
// ?    _FeedMainPageState? stateObj = context.findAncestorStateOfType<_FeedMainPageState>();
//  FIXME:
    /*
    void _removeFeed(FeedCreator feed) {
      stateObj!.setState(() {
        FeedMainPage.feeds.remove(feed);
        --FeedMainPage.count;
      });
    }*/

    List<Widget> _feeds =
        List.generate(FeedMainPage.count, (int i) => FeedMainPage.feeds[i])
            .reversed
            .toList();

    return Container(
      color: const Color(0xfff1f1f1),
      child: SingleChildScrollView(
        child: Column(
          children: _feeds,
        ),
      ),
    );
  }
}
