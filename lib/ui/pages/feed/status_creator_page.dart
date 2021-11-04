import 'package:flutter/material.dart';
import 'feed_main_page.dart';
import 'feed_creator.dart';
import '../add_challenge.dart';

class StatusCreator extends StatefulWidget {
  const StatusCreator({Key? key, this.context}) : super(key: key);
  final dynamic context;
  @override
  _StatusCreator createState() => _StatusCreator();
}

class _StatusCreator extends State<StatusCreator> {
  String _text = '';
  final _controller = TextEditingController();

  _changeText() {
    setState(() => {
      _text = _controller.text,
    });
  }

  _changeFeedMain() {
    setState(() {
      ++FeedMainPage.count;
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

  //CANCEL BUTTON
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
        FeedMainPage.isCreateBtn = false;
        CreateNewWidget.isCreateBtn = false;
        Navigator.pop(context);
      },
    );
  }

//CREATE BUTTON
  Widget _createBtn(context, text) {
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
        CreateNewWidget.isCreateBtn = true;
        FeedMainPage.addFeed(FeedCreator(textField: text, currentTime: DateTime.now(),));
        //_changeFeedMain();
        Navigator.pop(context);
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
            onSubmitted: (value) {},
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context = widget.context;
    return  Center(
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
    );
  }
}
