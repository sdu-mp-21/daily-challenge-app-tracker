import 'package:flutter/material.dart';
import 'feedcreator.dart';
import 'navigators/app_bar.dart';
import 'navigators/bottom_bar.dart';
import 'screens/status_creator_page.dart';
import 'status_create_helper.dart';
import 'database_helper.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
//  static const dynamic value = 'Second Feed';
  final DatabaseHelper _dbHelper =  DatabaseHelper();
  StatusCreateHelper sch = StatusCreateHelper();

  void check() {
    ///print('feedcreator.length : ');
  }

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
          child: FutureBuilder(
            initialData: [],
              future: _dbHelper.getTexts(),
              builder: (context, snapshot) {
                check();
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {

                    print("work! : ${snapshot.data}");
                    return const FeedCreator(textfield: " appBar: const GeneralAppBar() ppBar:  onst GeneralAppBar onst GeneralAppBar onst GeneralAppBar const Genera ppBar: const Genera");
                  },
                );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StatusCreator()),
          ).then((value) => () {
                setState(() {});
              });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const GeneralBottomBar(),
    );
  }
}
