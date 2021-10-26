import 'package:daily_challenge_tracker/feedcreator.dart';
import 'package:flutter/material.dart';
import 'feedcreator.dart';
import 'navigators/app_bar.dart';
import 'navigators/bottom_bar.dart';
import 'screens/status_creator_page.dart';

//import 'sanzhar/create_page.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);
  static  bool isCreateBtn = false;
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _count = 0;
  dynamic text;

  void _addNewFeeds() {
    setState(() {
      ++_count;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _feeds  = List.generate(_count, (int i) => const FeedCreator(textfield: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porttitor lacus. Integer luctus aliquet maximus. Nam diam diam, laoreet in lorem ullamcorper, varius ornare arcu. Pellentesque tincidunt posuere dictum. Curabitur vehicula leo sit amet malesuada tempor.'));

    return Scaffold(
      appBar: const GeneralAppBar(),
      body:  SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 2.0,
          ),
          color: const Color(0xfff1f1f1),
          child: ListView.builder(
            itemCount: _feeds.length,
            itemBuilder: (context, index) {
              //print("working! : ");
              return _feeds[index];

            },
          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StatusCreator()),
          ).then((value) => {
            if(Mainpage.isCreateBtn){
              setState(() {
                _addNewFeeds();
              })
            }
            else{}
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const GeneralBottomBar(),
    );
  }
}

