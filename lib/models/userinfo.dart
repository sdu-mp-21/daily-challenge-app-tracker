import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),

      child: SizedBox(

        width: double.infinity,
        child: Row(
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.redAccent,
              backgroundImage: AssetImage(
                  'assets/images/avatar.png'
              ),

            ),
            Padding(
              padding: EdgeInsets.only(
                left: 52.0,
              ),
              child: Text(
                'User Name',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}