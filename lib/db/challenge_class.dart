class Challenge {
  final String challengeTitle;
  final String challengeDescription;
  final challengeDays;
  //final String challengeDescription;
  //final boolean[] daysChecked;
  Challenge( {
    required this.challengeTitle,
    required this.challengeDescription,
    required this.challengeDays,
});

  // Convert a challenge into a Map. The keys must correspond to the names of the
  // columns in the database.
   Map<String, dynamic> toJson() {
    return {
      'challenge_title': challengeTitle,
      'challenge_description':challengeDescription,
      'challenge_days' : challengeDays,
    };
  }


  // Implement toString to make it easier to see information about
  // each challenge when using the print statement.
  @override
  String toString() {
    return 'Challenge{ challenge_title: $challengeTitle, challenge_description: $challengeDescription, challenge_days: $challengeDays}';
  }
   Challenge.fromJson(Map<String, Object?> json) : this(
    challengeTitle: json['challenge_title'] == null ? '' : json['challenge_title'] as String,
     challengeDescription: json['challenge_description'] == null ? '' : json['challenge_description'] as String,
     challengeDays: json['challenge_days'] as dynamic,
  );
}