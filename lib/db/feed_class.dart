class FeedDescription {
  final dynamic id, description;

  FeedDescription({this.id, this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'description': description};
  }
}
