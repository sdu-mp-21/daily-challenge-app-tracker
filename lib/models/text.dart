class Texts {
  final dynamic id, text;

  Texts({this.id, this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }
}
