import '../add_challenge.dart';
import 'feed_creator.dart';
import 'status_creator_page.dart';
import 'package:flutter/material.dart';
import '../../../db/feed_database.dart';


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

  }

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  final CreateNewWidget addWidget = CreateNewWidget(page: 1);
  final DatabaseHelper _dbHelper  = DatabaseHelper();
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

  /*  List<Widget> _feeds =
        List.generate(FeedMainPage.count, (int i) => FeedMainPage.feeds[i])
            .reversed
            .toList();*/


    /* SingleChildScrollView(
          child: Column(
            children: _feeds,
          ),
        )*/

    return Scaffold(
      body: Container(
        color: const Color(0xfff1f1f1),
        child: FutureBuilder (
            initialData: const [],
          future:_dbHelper.getTexts(),
          builder:  (context, AsyncSnapshot snapshot) {
              if(snapshot.data.length == null){
                print("No data, Null");
              }
              else if(snapshot.data.length == 0){
                print("length = 0");
              }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:(context, index){
                return FeedCreator(
                  key: UniqueKey(),
                  textField: snapshot.data[index].description,
                  currentTime: DateTime.now(),
                  //onRemoved: FeedMainPage.removeFeed,
                  //onFeedEdit: FeedMainPage.editFeed,
                  //context: context,
                );

              }
            );

          }


        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          tooltip: "Centre FAB",
          onPressed: () {

            addWidget.page = 1;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addWidget),
            ).then((value){
              setState(() {

              });
            });


          },
          child: const Icon(Icons.add),
        )
    );

  }
}
