import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChallengeDetailPage extends StatefulWidget {
  final String challengeTitle;
  final String challengeDesc;

  const ChallengeDetailPage({
    Key? key,
    required this.challengeTitle,
    required this.challengeDesc,
  }) : super(key: key);

  @override
  _ChallengeDetailPageState createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  late Challenge challenge;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    var result = await FirebaseFirestore.instance.collection("Challenges")
        .where("challenge_description", isEqualTo: widget.challengeDesc)
        .where("challenge_title", isEqualTo: widget.challengeTitle)
        .get();
    for (var d in result.docs) {
      // print(d.id);
      this.challenge = Challenge(challengeTitle: d['challenge_title'], challengeDescription: d['challenge_description'], challengeDays: d['challenge_days']);
      // print(res.data());
    }
    // print(result);
    // this.challenge = await ChallengeDatabase.instance.readNote(widget.challengeId);


    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [ deleteButton()],
    ),
    body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            this.challenge.challengeTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            this.challenge.challengeDescription,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

        ],
      ),
    ),
  );

  // Widget editButton() => IconButton(
  //     icon: Icon(Icons.edit_outlined),
  //     onPressed: () async {
  //       if (isLoading) return;
  //
  //       await Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => AddEditNotePage(note: note),
  //       ));
  //
  //       refreshNote();
  //     });

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete),
    onPressed: () async {

      var result = await FirebaseFirestore.instance.collection("Challenges").where("challenge_description", isEqualTo: widget.challengeDesc).where("challenge_title", isEqualTo: widget.challengeTitle).get();
      result.docs.forEach((d) {
        // print(d.id);
        FirebaseFirestore.instance.collection('Challenges').doc(d.id).delete();
        // print(res.data());
      });

      Navigator.of(context).pop();
    },
  );
}