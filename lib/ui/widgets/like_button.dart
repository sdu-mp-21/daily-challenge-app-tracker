import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeBtn extends StatelessWidget {
  const LikeBtn({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          likeCount: 0,
          countBuilder:  (var count, var isLiked, var txt)  {
            var color = isLiked ? Colors.red : Colors.grey;
             Widget result;
            if(count == 0) {
              // print(count);
              result = Text(
                '',
                  style: TextStyle(
                    color: color, fontSize: 15,
                  ),
              );
            }
            else {
              result = Text(
                txt,
                style: TextStyle(color: color, fontSize: 15,),
              );
            }
            return result;
          },
        ),
      ],
    );
  }


}

