import 'app_bar.dart';
import 'bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(),
      body: Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Centre FAB",
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: GeneralBottomBar(),
    );
  }
}
