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
        children:  [
          const CircleAvatar (
            radius: 20,
            backgroundImage: AssetImage(
                'assets/images/avatar.png'
            ),

          ),
          const Padding(
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
            padding: const EdgeInsets.only(
              left: 137,
            ),
            child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }

  void choiceAction (String choice){
    if(choice == 'edit')
      print("edit");
    else if (choice == 'delete')
      print("delete");
  }
}

class Constants {
  static const String edit = 'edit',
      delete = 'delete';
  static const List<String> choices = [
    edit,
    delete
  ];

}