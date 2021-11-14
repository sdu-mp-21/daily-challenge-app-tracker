import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:challenge_tracker/db/challenge_database.dart';
import 'package:flutter/material.dart';

class ChallengeDetailPage extends StatefulWidget {
  final int challengeId;

  const ChallengeDetailPage({
    Key? key,
    required this.challengeId,
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

    this.challenge = await ChallengeDatabase.instance.readNote(widget.challengeId);
    print(this.challenge);

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
      await ChallengeDatabase.instance.deleteChallenge(widget.challengeId);

      Navigator.of(context).pop();
    },
  );
}