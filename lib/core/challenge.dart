class Challenge {
  List<String> _challengeTitles = <String>[];
  List<int> _daysToDoList = <int>[];
  List<DateTime> _timeToStart = <DateTime>[];
  List<DateTime> _timeToEnd = <DateTime>[];

  Challenge.constructor1();

  Challenge.constructor2(this._challengeTitles, this._daysToDoList,
      this._timeToStart, this._timeToEnd);

  void addChallenge(String title, int daysToDoList, DateTime timeToStart,
      DateTime timeToEnd) {
    _challengeTitles.add(title);
    _daysToDoList.add(daysToDoList);
    _timeToStart.add(timeToStart);
    _timeToEnd.add(timeToEnd);
  }
  void removeAt(int index) {
    _challengeTitles.removeAt(index);
    _daysToDoList.removeAt(index);
    _timeToStart.removeAt(index);
    _timeToEnd.removeAt(index);
  }

  List<DateTime> get timeToEnd => _timeToEnd;

  set timeToEnd(List<DateTime> value) {
    _timeToEnd = value;
  }

  List<DateTime> get timeToStart => _timeToStart;

  set timeToStart(List<DateTime> value) {
    _timeToStart = value;
  }

  List<int> get daysToDoList => _daysToDoList;

  set daysToDoList(List<int> value) {
    _daysToDoList = value;
  }

  List<String> get challengeTitles => _challengeTitles;

  set challengeTitles(List<String> value) {
    _challengeTitles = value;
  }
}
