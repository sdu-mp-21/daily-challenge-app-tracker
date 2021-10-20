import 'package:flutter/material.dart';


class Userinfo extends StatelessWidget{
  const Userinfo({Key? key}) : super(key: key);


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
        children: const [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                'assets/images/avatar.png'
            ),

          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              'User Name',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Georgia",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 185,
            ),
            child: Image(

              width: 20.0,
              height: 20.0,
              image: AssetImage(
                'assets/images/optionIcon.png'
              ),
            ),
          ),
        ],
      ),
    );
  }
}