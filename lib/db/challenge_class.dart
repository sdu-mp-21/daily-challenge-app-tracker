class Challenge {
  final dynamic id;
  final String challengeTitle;
  //final String challengeDescription;
  //final boolean[] daysChecked;
  Challenge( {
    this.id,
    required this.challengeTitle,
});

  // Convert a challenge into a Map. The keys must correspond to the names of the
  // columns in the database.
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'challenge_title': challengeTitle,
    };
  }


  // Implement toString to make it easier to see information about
  // each challenge when using the print statement.
  @override
  String toString() {
    return 'Challenge{id: $id, challenge_title: $challengeTitle}';
  }
   Challenge.fromJson(Map<String, Object?> json) : this(
    id: json['id'] as dynamic,
    challengeTitle: json['challenge_title'] == null ? '' : json['challenge_title'] as String,
  );
}