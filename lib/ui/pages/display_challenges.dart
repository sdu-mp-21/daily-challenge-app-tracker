import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:challenge_tracker/db/challenge_database.dart';
import 'package:challenge_tracker/ui/widgets/challenge_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:challenge_tracker/ui/widgets/challenge_details_page.dart';
import 'add_challenge.dart';

class DisplayChallenges extends StatefulWidget {
  const DisplayChallenges({Key? key}) : super(key: key);

  @override
  _DisplayChallengesState createState() => _DisplayChallengesState();
}

class _DisplayChallengesState extends State<DisplayChallenges> {
  late List<Challenge> challenges;
  bool isLoading = false;
  final CreateNewWidget addWidget = CreateNewWidget(page: 0);

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  // @override
  // void dispose() {
  //   ChallengeDatabase.instance.close();
  //   super.dispose();
  // }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    challenges = await ChallengeDatabase.instance.challenges();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          // child: Text(Challenge(id:0, challengeTitle: 'name').toMap().toString()),
        child: isLoading
            ? const CircularProgressIndicator()
            : challenges.isEmpty
            ? const Text(
          'Empty Challenge List',
          style: TextStyle(color: Colors.black, fontSize: 24),
        )
            : buildChallenges(challenges),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          tooltip: "Centre FAB",
          onPressed: () {

            addWidget.page = 0;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addWidget),
            );

            refreshNotes();
          },
          child: const Icon(Icons.add),
        )
    );
  }

  Widget buildChallenges(challenges) => StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8),
        itemCount: challenges.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final Challenge challenge = challenges[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ChallengeDetailPage(challengeId: challenge.id),
              ));

              refreshNotes();
            },
            child: ChallengeCardWidget(
              challenge: challenge,
              index: index,
            ),
          );
        },
      );
}
