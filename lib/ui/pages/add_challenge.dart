import 'package:challenge_tracker/db/challenge_class.dart';
import '../../ui/widgets/buttons.dart';
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

  //String _value = "";
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
      createTitle = "Challenge";
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                labelText: 'Title of the challenge',
                icon: Icon(Icons.add)),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: descriptionController,
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
                labelText: 'Description of the challenge',
                icon: Icon(Icons.add)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: Style.raisedButtonStyle,
                child: const Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: Style.raisedButtonStyle,
                child: const Text("ADD"),
                onPressed: () async {

                  final challengeRef = FirebaseFirestore.instance.collection('Challenges')
                      .withConverter<Challenge>(
                      fromFirestore: (snapshot, _) => Challenge.fromJson(snapshot.data()!),
                      toFirestore: (challenge, _) => challenge.toJson(),
                  );
                  print('here');
                  print(challengeRef);
                  // challenges = await ChallengeDatabase.instance.challenges();


                  challengeRef.add(
                      Challenge(
                          challengeTitle: titleController.text,
                          challengeDescription: descriptionController.text,
                          challengeDays: [false, false, false, false, false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false],
                          )
                  );



                  // Challenge challengeToInsert = Challenge(
                  //     id: challenges.length, challengeTitle: controller.text);
                  // print(challenges.length);
                  // print(controller.text);
                  // ChallengeDatabase.instance.insertChallenge(challengeToInsert);
                  Navigator.of(context).pop();
                },
              )
            ],
          )
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
