import 'text_field.dart';
import '../../widgets/user_info.dart';
import 'package:flutter/material.dart';
import '../../widgets/like_button.dart';
import '../../widgets/share_btn.dart';

class FeedCreator extends StatefulWidget {
  final dynamic textField;

  const FeedCreator({Key? key, this.textField}) : super(key: key);

  @override
  State<FeedCreator> createState() => _FeedCreatorState();
}

class _FeedCreatorState extends State<FeedCreator> {
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
          const Userinfo(),
          TextFieldCustom(
            text: widget.textField,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: LikeBtn()),
              //TODO: add reply button
              ShareBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
