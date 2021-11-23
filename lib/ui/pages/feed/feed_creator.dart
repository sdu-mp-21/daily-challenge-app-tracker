import 'text_field.dart';
import '../../widgets/feed_header.dart';
import 'package:flutter/material.dart';
import '../../widgets/like_button.dart';
import '../../widgets/share_btn.dart';

class FeedCreator extends StatefulWidget {
  final dynamic textField;
  final DateTime currentTime;
  //final Function onRemoved;
  //final Function onFeedEdit;
  final dynamic context;

  @override
  //final Key key;

  const FeedCreator({
    Key? key,
    this.textField,
    required this.currentTime,
    //required this.onRemoved,
    //required this.onFeedEdit,
    this.context,
  }) : super(key: key);

  @override
  State<FeedCreator> createState() => _FeedCreatorState();
}

class _FeedCreatorState extends State<FeedCreator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 3.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3.0,
          color: const Color(0xffD3D3D3),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           FeedHeader(
             key: widget.key,
             currentTime: widget.currentTime,
             //removeFeed: widget.onRemoved,
             feed: widget,
             //onFeedEdit: widget.onFeedEdit,
             context: widget.context,
           ),
          TextFieldCustom(
            text: widget.textField,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Container(
                margin: const EdgeInsets.only(left: 20.0,),
                  child: const LikeBtn()
              ),
              const ShareBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
