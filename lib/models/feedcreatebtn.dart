import 'package:flutter/material.dart';

class FeedCreateBtn extends StatelessWidget {
  const FeedCreateBtn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
