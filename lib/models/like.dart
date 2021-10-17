import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Like extends StatelessWidget {
  late int counter;

  void increments(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          LikeButton(
            size: 30.0,
            circleColor: const CircleColor(start: Colors.red, end: Colors.blue),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.red,
              dotSecondaryColor: Colors.yellow,
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : Colors.grey,
                size: 30.0,
              );
            },
            likeCount: 99,
            countBuilder:  (var count, var isLiked, var txt)  {
              var color = isLiked ? Colors.red : Colors.grey;
               Widget result;
              if(count == 0) {
                print(count);
                result = Text(
                  '',
                    style: TextStyle(
                      color: color, fontSize: 25,
                    ),
                );
              }
              else{
                result = Text(
                  txt,
                  style: TextStyle(color: color, fontSize: 15,),
                );
              }
              return result;
            },
          ),
        ],
      ),
    );
  }


}


class LikeB1utton extends StatefulWidget {
  const LikeB1utton({Key? key}) : super(key: key);


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