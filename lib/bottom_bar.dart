import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBottomBar extends StatelessWidget {
  const GeneralBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      color: Colors.orange.shade300,
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              //update the bottom app bar view each time an item is clicked
              onPressed: () {},
              iconSize: 27.0,
              icon: Icon(Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: Colors.white),
            ),
            IconButton(
              //update the bottom app bar view each time an item is clicked
              onPressed: () {},
              iconSize: 27.0,
              icon: Icon(Icons.chat,
                  //darken the icon if it is selected or else give it a different color
                  color: Colors.grey.shade400),
            )
          ],
        ),
      ),
    );
  }
}
