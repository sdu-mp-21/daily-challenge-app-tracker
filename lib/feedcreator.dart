import 'package:flutter/material.dart';
import 'models/textfield.dart';
import 'models/userinfo.dart';
import 'models/like.dart';
import 'models/view.dart';

class FeedCreator extends StatefulWidget {
  const FeedCreator({Key? key}) : super(key: key);

  @override
  State<FeedCreator> createState() => _FeedCreatorState();
}

class _FeedCreatorState extends State<FeedCreator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3.0,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Userinfo(),
          const Textfield(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                  ),
                  child: Like()),
              const Padding(
                padding: EdgeInsets.only(
                  right: 24.0,
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
