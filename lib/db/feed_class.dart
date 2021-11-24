class FeedDescription {
  final dynamic id, description;
  //dynamic t  = DateTime.now();
  //DateTime time = DateTime.now();
  FeedDescription({this.id, this.description, });

  Map<String, dynamic> toMap() {
    return {'id': id, 'description': description};
  }
}
