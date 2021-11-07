import 'package:flutter/material.dart';
import 'time_ago.dart';
import '../pages/feed/feed_main_page.dart';
import '../pages/feed/feed_creator.dart';

class Userinfo extends StatelessWidget{
  final DateTime currentTime;
  final Function removeFeed;
  final FeedCreator feed;
  const Userinfo({Key? key, required this.currentTime, required this.removeFeed, required this.feed}) : super(key: key);



  void feedCreatorAction (FeedCreator feed){

  }

  Widget userAvatarAndName(){
    return Row(
      children:  [
        const CircleAvatar (
          radius: 20,
          backgroundImage: AssetImage(
              'assets/images/avatar.png'
          ),

        ),
         Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
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
        children:  [
          userAvatarAndName(),
          // Options Button
          Align(
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
          ),
        ],
      ),
    );
  }

  void choiceAction (String choice){
    if(choice == 'edit') {
      //print("edit");
    } else if (choice == 'delete'){

      FeedMainPage.isDeleteBtn = true;
      removeFeed(feed);
      //FeedMainPage.removeFeed();
    }
  }


}

class Constants {
  static const String edit = 'edit',
      delete = 'delete';
  static const List<String> choices = [
    edit,
    delete
  ];

}