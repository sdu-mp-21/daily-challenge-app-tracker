import 'package:challenge_tracker/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CreateNewWidget extends StatelessWidget {
  final int page;

  const CreateNewWidget({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String createTitle = "";
    if (page == 0) {
      createTitle = "Challenge";
    } else if (page == 1) {
      createTitle = "Post";
    }
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange.shade300,
            leading: const Icon(Icons.arrow_back),
            title: Text(createTitle),
          ),
          body: _CreateNewWidget(createTitle),
        ));
  }
}

class _CreateNewWidget extends StatefulWidget {
  final String createTitle;

  const _CreateNewWidget(this.createTitle);

  @override
  State<StatefulWidget> createState() {
    return _CreateNewWidgetState();
  }
}

class _CreateNewWidgetState extends State<_CreateNewWidget> {
  // Initialise outside the build method
  FocusNode nodeMainText = FocusNode();
  FocusNode nodeDescription = FocusNode();

  String _value = "";

  @override
  Widget build(BuildContext context) {
    if (widget.createTitle == "Challenge") {
      return setChallenge();
    } else {
      return setPost();
    }
  }

  Widget setChallenge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Center(
            child: Text(
              widget.createTitle,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.3),
            ),
          ),
          const SizedBox(height: 30),
          inputTextChallenge(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: Style.raisedButtonStyle,
                child: const Text("Time"),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget setPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Center(
            child: Text(
              widget.createTitle,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.3),
            ),
          ),
          const SizedBox(height: 30),
          inputTextPost(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

//TODO Add some usability in textField Widget, more function
  Widget inputTextChallenge() {
    TextEditingController controller = TextEditingController();

    controller.addListener(() {
      // Do something here
    });
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      focusNode: nodeMainText,
      autofocus: false,
      onChanged: (text) {
        // setState(() {
        _value = text;
        // });
      },
      onSubmitted: (text) {
        setState(() {
          _value = text;
        });
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Write here',
          icon: Icon(Icons.add)),
    );
  }

//TODO Add some usability in textField Widget, more function
  Widget inputTextPost() {
    TextEditingController controller = TextEditingController();

    controller.addListener(() {
      // Do something here
    });
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: controller,
      // keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      focusNode: nodeMainText,
      autofocus: true,
      onChanged: (text) {
        // setState(() {
        _value = text;
        // });
      },
      onSubmitted: (text) {
        setState(() {
          _value = text;
        });
      },
      decoration: InputDecoration(
          filled: true,
          hintText: 'Text',
          hintMaxLines: 3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon: const Icon(Icons.post_add)),
    );
  }
}
