//import 'package:challenge_tracker/ui/pages/feed/status_creator_page.dart';
import 'package:flutter/material.dart';
import 'time_ago.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../ui/pages/auth/profile_class.dart';

class FeedHeader extends StatefulWidget {
  final dynamic currentTime;

  final dynamic feedId;
  final dynamic textField;
  final Function edit;
  final dynamic userName;
  final dynamic userPhotoUrl;

  const FeedHeader({
    Key? key,
    required this.edit,
    this.textField,
    this.userName,
    this.userPhotoUrl,
    required this.currentTime,
    required this.feedId,
  }) : super(key: key);

  @override
  State<FeedHeader> createState() => _FeedHeaderState();
}

class _FeedHeaderState extends State<FeedHeader> {
  String _userName = 'User Name';

  ImageProvider userAvatar() {
    if (widget.userPhotoUrl != "") {
      return NetworkImage(widget.userPhotoUrl);
    } else {
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
    _userName = (widget.userName != "") ? widget.userName : "User Name";

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      },
      child: Row(
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
                  TimeAgo.displayTimeAgoFromTimestamp(widget.currentTime),
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
      ),
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
    if (choice == 'edit') {
      widget.edit(true, widget.feedId, widget.textField);
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
