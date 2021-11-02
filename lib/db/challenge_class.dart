class Challenge {
  final int id;
  final String challengeTitle;
  Challenge({
    required this.id,
    required this.challengeTitle,
});

  // Convert a challenge into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
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

}