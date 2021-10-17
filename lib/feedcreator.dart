import 'package:flutter/material.dart';
import 'models/textfield.dart';
import 'models/userinfo.dart';
import 'models/likebtn.dart';
import 'models/view.dart';

class FeedCreator extends StatefulWidget {
  final dynamic textfield;
  const FeedCreator({Key? key, this.textfield}) : super(key: key);

  @override
  State<FeedCreator> createState() => _FeedCreatorState(textfield);
}

class _FeedCreatorState extends State<FeedCreator> {
   dynamic textfield;
  _FeedCreatorState(this.textfield);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
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
          Userinfo(),
            Textfield(
              text: textfield,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: const [
              Padding(
                  padding:  EdgeInsets.only(
                    left: 24.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: LikeBtn()),
               Padding(
                padding: EdgeInsets.only(
                  right: 24.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Views(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
