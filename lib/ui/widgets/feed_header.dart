import 'package:flutter/material.dart';
import 'time_ago.dart';
import '../pages/feed/feed_creator.dart';
import '../pages/feed/status_creator_page.dart';

class FeedHeader extends StatelessWidget {
  final DateTime currentTime;
  //final Function removeFeed;
  //final Function onFeedEdit;
  final dynamic context;
  final FeedCreator feed;

  const FeedHeader({
    Key? key,
    required this.currentTime,
    //required this.removeFeed,
    required this.feed,
    //required this.onFeedEdit,
    this.context,
  }) : super(key: key);

  // ! PopupMenuButtons
  Widget getPopupMenuButtons(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      widthFactor: 1.0,
      child: PopupMenuButton<String>(
        onSelected: choiceAction,
        itemBuilder: (BuildContext context) {
          return Constants.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }

  // ! User Avatar and Name
  Widget userAvatarAndName() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Name',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Georgia",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                TimeAgo.displayTimeAgoFromTimestamp(currentTime.toString()),
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  color: Color(0xFF878585),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10.0,
        left: 10,
        top: 10.0,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userAvatarAndName(),
          // Options Button
          getPopupMenuButtons(context),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    // ! FIXME: edit button doesn't work yet
    if (choice == 'edit') {
      // * onFeedEdit(feed);
      if (context != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StatusCreator()),
        );
      } else
        print('Null context');
    } else if (choice == 'delete') {
      //removeFeed(feed);
    }
  }
}

class Constants {
  static const String edit = 'edit', delete = 'delete';
  static const List<String> choices = [edit, delete];
}
