import 'package:flutter/material.dart';

class Like extends StatelessWidget {
  late int counter;

  void increments(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
              LikeButton(),

        ],
      ),
    );
  }


}


class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);


  @override
  State createState() => _LikeButton();
}

class _LikeButton  extends State<LikeButton>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Image(
        image: AssetImage(
          'assets/images/like.png',
        ),
      ),
    );
  }
}