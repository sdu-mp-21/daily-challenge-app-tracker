import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class StatusCreator extends StatefulWidget {
  const StatusCreator({Key? key, this.context,  this.fd})
      : super(key: key);
  final dynamic context;
  final dynamic fd;

  @override
  _StatusCreator createState() => _StatusCreator();
}

class _StatusCreator extends State<StatusCreator> {
  final  _user = FirebaseAuth.instance.currentUser;
  String _userName = 'User Name';
  String _photoURL = "";
  String _text = '';
  final _controller = TextEditingController();

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }


  _changeText() {
    setState(() => {
          _text = _controller.text,
        });
  }

  @override
  initState() {
    initFireBase();
    super.initState();
    //_controller.text = _text;
    _controller.addListener(_changeText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ! CANCEL BUTTON
  Widget _cancelBtn(context) {
    return TextButton(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 50.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red,
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

// ! CREATE BUTTON
  Widget _createBtn(context, _newDescription) {
    return TextButton(
      child: Container(
        //width: 180.0,
        padding: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 50.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.lightBlue,
        ),
        child: const Text(
          'Create',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {
        var now = DateTime.now().toString();
        if(_user != null){
          _userName =
          (_user?.displayName != null) ? _user!.displayName.toString() : "";
          _photoURL = (_user?.photoURL != null) ? _user!.photoURL.toString() : "";
        }
        FirebaseFirestore.instance.collection('feeds')
            .add({
          'description': _newDescription,
          'time_ago': now,
          'username': _userName,
          'photoURL': _photoURL
            });


        Navigator.pop(context);
      },
    );
  }




//INPUT TEXT
  Widget _textField() => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200.0),
              child: TextField(
                autofocus: false,
                controller: _controller,
                decoration: const InputDecoration(

                  labelText: 'My Situation',
                  //hintText: 'My Situation',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xFFB5B2B2),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                maxLength: 500,
                minLines: 1,
                maxLines: 5,
                onSubmitted: (value) {
                  /*print(value);
                  if (value != "") {
                    if (widget.fd == null) {
                      print("create new ");
                      FeedDescription _newFeedDesc = FeedDescription(description: value);
                      await _dbHelper.insertText(_newFeedDesc);
                    }
                    else {
                      await _dbHelper.updateFeed(_feedId, value);

                      print("Update");

                    }
                  }*/
                },
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {

    context = widget.context;
    return Scaffold(
      body: KeyboardDismisser(
        gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //LOGO
                Container(
                  width: 120.0,
                  height: 120.0,
                  margin: const EdgeInsets.all(15.0),
                  child: const Image(
                    image: AssetImage('assets/images/statusIcon.png'),
                  ),
                ),
                // LOGO'S TEXT
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  child: const Text(
                    'Create Post',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7BC426),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: _textField()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _cancelBtn(context),
                    _createBtn(context, _text),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
