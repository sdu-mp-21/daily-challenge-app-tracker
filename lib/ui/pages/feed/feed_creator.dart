import 'text_field.dart';
import '../../widgets/feed_header.dart';
import 'package:flutter/material.dart';
import '../../widgets/like_button.dart';
import '../../widgets/share_btn.dart';
class FeedCreator extends StatefulWidget {
  final dynamic feedId;
  final dynamic textField;
  final dynamic currentTime;
  final dynamic userName;

  final dynamic userPhotoUrl;
  final Function edit;

  @override
  const FeedCreator({
    Key? key,
    required this.edit,
    this.userName,
    this.userPhotoUrl,
    required this.feedId,
    this.textField,
    required this.currentTime,
  }) : super(key: key);

  @override
  State<FeedCreator> createState() => _FeedCreatorState();
}

class _FeedCreatorState extends State<FeedCreator> {
  String _feedId = "";
  @override
  void initState() {
    if(widget.feedId != null) {
      _feedId = widget.feedId;
    }
    super.initState();
  }
//
  //sdsdfsave(widget.fd, "sdsdf", "sds");
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
             feedId: _feedId,
             edit: widget.edit,
             textField:widget.textField,
             userName: widget.userName,
             userPhotoUrl: widget.userPhotoUrl,
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
