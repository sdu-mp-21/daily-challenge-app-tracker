import 'package:flutter/material.dart';
import 'time_ago.dart';
import '../pages/feed/feed_creator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedHeader extends StatefulWidget {
  final DateTime currentTime;
  final dynamic context;
  final dynamic feedId;
  final FeedCreator feed;
  final dynamic userName;
  final dynamic userPhotoUrl;


  const FeedHeader({
    Key? key,
    this.userName,
    this.userPhotoUrl,
    required this.currentTime,
    required this.feedId,
    required this.feed,
    this.context,
  }) : super(key: key);

  @override
  State<FeedHeader> createState() => _FeedHeaderState();
}

class _FeedHeaderState extends State<FeedHeader> {
  final _user = FirebaseAuth.instance.currentUser;
  String _userName = 'User Name';
  ImageProvider userAvatar() {

      if(widget.userPhotoUrl != ""){
        return NetworkImage(widget.userPhotoUrl);
      }else {
        return const AssetImage('assets/images/avatar.png');
      }

  }

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

  Widget userAvatarAndName() {
      _userName =
      (widget.userName != "") ? widget.userName : "User Name";

    //print('_userName: $_userName');
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: userAvatar(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _userName,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Georgia",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                TimeAgo.displayTimeAgoFromTimestamp(
                    widget.currentTime.toString()),
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

  void choiceAction(String choice) async {
    // ! FIXME: edit button doesn't work yet
    if (choice == 'edit') {
      // * onFeedEdit(feed);
      /*Navigator.push(
          widget.context,
          MaterialPageRoute(builder: (context) => const StatusCreator()),
        );*/

    } else if (choice == 'delete') {
      FirebaseFirestore.instance
          .collection('feeds')
          .doc(widget.feedId)
          .delete();
      //removeFeed(feed);
    }
  }
}

class Constants {
  static const String edit = 'edit', delete = 'delete';
  static const List<String> choices = [edit, delete];
}
