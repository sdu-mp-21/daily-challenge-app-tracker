
import '../feedcreator.dart';


class StatusCreateHelper {
  static List<FeedCreator> feeds = [];

  void addFeeds (FeedCreator feed) {
    feeds.add(feed);
  }

   Future<List<FeedCreator>> getFeeds() async {
    return List.generate(feeds.length, (index) {
      return FeedCreator(textfield: feeds[index],);
    });
  }

  List<FeedCreator> getFeedss() {

    return feeds;
  }

}

