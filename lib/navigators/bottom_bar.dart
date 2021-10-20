import 'package:flutter/material.dart';

class GeneralBottomBar extends StatelessWidget {
  bool first_active = true;
  bool second_active = false;
  GeneralBottomBar(this.first_active, this.second_active);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      color: Colors.orange.shade300,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            //update the bottom app bar view each time an item is clicked
            tooltip: "Home",
            onPressed: () => Navigator.pop(context),
            iconSize: 27.0,
            icon: Icon(Icons.home,
                //darken the icon if it is selected or else give it a different color
                color: first_active ? Colors.white : Colors.grey.shade400),
          ),
          IconButton(
            //update the bottom app bar view each time an item is clicked
            tooltip: "Feed",
            onPressed: () => Navigator.pushNamed(context, '/second'),
            iconSize: 27.0,
            icon: Icon(Icons.chat,

                //darken the icon if it is selected or else give it a different color
                color: second_active ? Colors.white : Colors.grey.shade400),
          )
        ],
      ),
    );
  }
}
