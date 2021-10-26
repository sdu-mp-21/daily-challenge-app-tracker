import 'package:flutter/material.dart';
//import 'package:floatingpanel/floatingpanel.dart';

class Userinfo extends StatefulWidget{
  const Userinfo({Key? key}) : super(key: key);


  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo>{
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:   [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                'assets/images/avatar.png'
            ),

          ),
          const Padding(
            padding:  EdgeInsets.only(
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
          //PopUp Menu Button
          Padding(
            padding: const EdgeInsets.only(
              left: 137,
            ),
            child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return  Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },

            ),
            /*IconButton(

              icon: const Image(
                width: 20.0,
                height: 20.0,
                image: AssetImage(
                    'assets/images/optionIcon.png'
                ),
              ),
              onPressed: () {
              },
            ),*/
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