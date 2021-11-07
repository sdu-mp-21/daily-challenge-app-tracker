import 'feed_creator.dart';
import 'package:flutter/material.dart';

class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);
  static bool isCreateBtn = false;
  static int count = 0;
  static List<FeedCreator> feeds = [];
  static bool isDeleteBtn = false;
  static void addFeed(FeedCreator feed) {
    feeds.add(feed);
    ++count;
  }

  static of(BuildContext context, {bool root = false}) => root  ? context.findRootAncestorStateOfType<_FeedMainPageState>()
      : context.findAncestorStateOfType<_FeedMainPageState>();

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
  static void removeFeed(FeedCreator feed) {
    feeds.remove(feed);
    --count;

  }




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
      //width: double.infinity,

      color: const Color(0xfff1f1f1),
      child: SingleChildScrollView(
        child: Column(
          children: _feeds,
        ),
      ),

    );
  }
}
