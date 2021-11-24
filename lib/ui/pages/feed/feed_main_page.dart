import '../add_challenge.dart';
import 'feed_creator.dart';

//import 'status_creator_page.dart';
import 'package:flutter/material.dart';
import '../../../db/feed_database.dart';

class FeedMainPage extends StatefulWidget {
   const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  final CreateNewWidget addWidget = CreateNewWidget(page: 1);
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {


    /* SingleChildScrollView(
          child: Column(
            children: _feeds,
          ),
        )*/

    return Scaffold(
        body: Container(
          color: const Color(0xfff1f1f1),
          child: FutureBuilder(
              initialData: const [],
              future: _dbHelper.getTexts(),
              builder: (context, AsyncSnapshot snapshot) {
                return ListView.builder(

                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var i = snapshot.data[index];
                      addWidget.fd = i;
                      return FeedCreator(
                        key: UniqueKey(),
                        fd: i,
                        textField: snapshot.data[index].description,
                        currentTime: DateTime.now(),
                        //onRemoved: FeedMainPage.removeFeed,
                        //onFeedEdit: FeedMainPage.editFeed,
                        //context: context,
                      );
                    });
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          tooltip: "Centre FAB",
          onPressed: () {
            addWidget.page = 1;
            addWidget.fd = null;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addWidget),
            ).then((value) {
              setState(() {});
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
