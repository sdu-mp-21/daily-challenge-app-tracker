import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
      challenge = Challenge(challengeTitle: d['challenge_title'], challengeDescription: d['challenge_description'], challengeDays: d['challenge_days'], challengeStart: d['challenge_start']);
      // print(res.data());
    }
    // print(result);
    // this.challenge = await ChallengeDatabase.instance.readNote(widget.challengeId);


    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // print('here');
    // print(challenge.challengeStart);
    return Scaffold(

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
              challenge.challengeTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              challenge.challengeDescription,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            calendar(challenge.challengeDays, challenge.challengeStart.toDate()),

            // calendar(challenge.challengeDays, DateTime.fromMicrosecondsSinceEpoch(challenge.challengeStart.seconds *1000)),

          ],
        ),
      ),
    );
  }

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

  Widget calendar(List days, DateTime start) {
    return SfCalendar(
      view: CalendarView.month,
      dataSource: ChallengeDays(getAppointments(days, start)),
      firstDayOfWeek: 1,
    );
  }
  List<Appointment> getAppointments(List days, DateTime start) {
    List<Appointment> challengeDays = <Appointment>[];
    print(start);
    for(int i = 0; i < days.length; i++) {

      final DateTime startTime;
      final DateTime endTime;
      if(i == 0) {
        startTime = DateTime(start.year, start.month, start.day, 0, 0, 0);
        endTime = startTime.add(const Duration(hours: 23));
      }
      else {
        DateTime elseDay = start.add(Duration(days: i));
        startTime = DateTime(elseDay.year, elseDay.month, elseDay.day, 0, 0, 0);
        endTime = startTime.add(const Duration(hours: 23));
      }
      challengeDays.add(Appointment(
          startTime: startTime,
          endTime: endTime,
          color: days[i] ? Colors.green : Colors.black38,
          isAllDay: true
      ),
      );

    }

    return challengeDays;


  }
}
class ChallengeDays extends CalendarDataSource {
  ChallengeDays(List<Appointment> source) {
    appointments = source;
  }
}