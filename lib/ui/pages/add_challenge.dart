import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'feed/status_creator_page.dart';

class CreateNewWidget extends StatefulWidget {
  String createTitle = "";
  // ? feedId and textfield need for update feed
  dynamic feedID;
  dynamic textfield;
  int page = 0;


  CreateNewWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateNewWidgetState();
  }
}

class _CreateNewWidgetState extends State<CreateNewWidget> {
  // Initialise outside the build method
  FocusNode nodeMainText = FocusNode();
  FocusNode nodeDescription = FocusNode();

  String createTitle = "";
  late List<Challenge> challenges;

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }



  @override
  Widget build(BuildContext context) {
    int page = 0;
    if (widget.page == 0) {
      createTitle = "Add Challenge";
      page = 0;
    } else if (widget.page == 1) {
      page = 1;
      createTitle = "Post";
    }
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange.shade300,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(createTitle),
          ),
          body: (page == 0) ? setChallenge() : StatusCreator(context: context, feedID : widget.feedID, textfield : widget.textfield),
        ));
  }

  Widget setChallenge() {
    TextEditingController titleController = TextEditingController();
    titleController.addListener(() {
      // Do something here
    });
    TextEditingController descriptionController = TextEditingController();
    descriptionController.addListener(() {
      // Do something here
    });

    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          //LOGO
          Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              margin: const EdgeInsets.all(15.0),
              child: const Image(
                image: AssetImage('assets/images/challenge-icon2.png'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              createTitle,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.3),
            ),
          ),
          const SizedBox(height: 30),
          Padding(padding: const EdgeInsets.only(left:20.0, right: 20.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: nodeMainText,
                  autofocus: false,
                  // onChanged: (text) {
                  //   // setState(() {
                  //   _value = text;
                  //   // });
                  // },
                  // onSubmitted: (text) {
                  //   setState(() {
                  //     _value = text;
                  //   });
                  // },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title of the challenge',),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: nodeDescription,
                  autofocus: false,
                  // onChanged: (text) {
                  //   // setState(() {
                  //   _value = text;
                  //   // });
                  // },
                  // onSubmitted: (text) {
                  //   setState(() {
                  //     _value = text;
                  //   });
                  // },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description of the challenge',),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 50.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                  ),
                  child: const Text('Cancel',
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
              ),

              TextButton(
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
                onPressed: () async {

                  final challengeRef = FirebaseFirestore.instance.collection('Challenges')
                      .withConverter<Challenge>(
                    fromFirestore: (snapshot, _) => Challenge.fromJson(snapshot.data()!),
                    toFirestore: (challenge, _) => challenge.toJson(),
                  );

                  // challenges = await ChallengeDatabase.instance.challenges();


                  challengeRef.add(
                      Challenge(
                          challengeTitle: titleController.text,
                          challengeDescription: descriptionController.text,
                          challengeDays: [false, false, false, false, false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false],
                          challengeStart: DateTime.now()
                      )
                  );


                  Navigator.of(context).pop();
                },
              )
            ],
          ),

        ],
      ),
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
        //_value = text;
        // });
      },
      onSubmitted: (text) {
        setState(() {
          //_value = text;
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
