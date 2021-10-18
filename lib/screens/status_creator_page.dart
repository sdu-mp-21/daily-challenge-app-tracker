import 'package:flutter/material.dart';
import '../feedcreator.dart';
import '../mainpage.dart';

import '../database_helper.dart';
import '../models/text.dart';

class StatusCreator extends StatefulWidget {
  const StatusCreator({Key? key}) : super(key: key);

  @override
  _StatusCreator createState() => _StatusCreator();
}

class _StatusCreator extends State<StatusCreator> {
  String _text = '', s = '';
  List<FeedCreator> feeds = <FeedCreator>[];
  final _controller = TextEditingController();

  _changeText() {
    setState(() => {
          _text = _controller.text,
        });
  }

  @override
  initState() {
    super.initState();
    _controller.text = _text;
    _controller.addListener(_changeText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<FeedCreator> getFeeds() {
    return feeds;
  }

  void addFeed(FeedCreator feed) {
    feeds.add(feed);
  }

  //CANCEL BUTTON
  Widget _cancelBtn(context) {
    return TextButton(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 40.0,
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

//CREATE BUTTON
  Widget _createBtn(context, text) {
    return TextButton(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 40.0,
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
        s = _controller.text;
        //addFeed(FeedCreator(textfield: s,));

        //print('getFeeds().length:  ${getFeeds().length}' );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Mainpage(),
          ),
        );
      },
    );
  }

//INPUT TEXT
  Widget _textField() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'My Situation',
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
            maxLength: 100,
            minLines: 1,
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                DatabaseHelper _dbHelper = DatabaseHelper();
                Texts text = Texts(text: value);
                await _dbHelper.insertText(text);

                print("new Feed created");
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              margin: const EdgeInsets.all(15.0),
              child: const Image(
                image: AssetImage('assets/images/statusIcon.png'),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                bottom: 15.0,
              ),
              child:const  Text('Create Status',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
              ),
                child: _textField()
            ),
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
    );
  }
}
