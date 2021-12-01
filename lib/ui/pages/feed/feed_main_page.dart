import '../add_challenge.dart';
import 'feed_creator.dart';
import 'package:flutter/material.dart';
import '../../../db/feed_database.dart';

class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  final CreateNewWidget addWidget = CreateNewWidget(page: 1);
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DateTime time = DateTime.now();

  Widget createPost() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: CustomPaint(
        painter: CurvePainter(),
        child: const Center(
            child: Text('Create Status',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /* SingleChildScrollView(
          child: Column(
            children: _feeds,
          ),
        )*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff1f1f1),
        elevation: 0,
        title: GestureDetector(
            onTap: () {
              addWidget.page = 1;
              addWidget.fd = null;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addWidget),
              ).then((value) {
                setState(() {});
              });
            },
            child: createPost()),
      ),
      body: Container(
        color: const Color(0xfff1f1f1),
        child: FutureBuilder(
            initialData: const [],
            future: _dbHelper.getTexts(),
            builder: (context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var i = snapshot.data[index];
                    addWidget.fd = i;
                    return FeedCreator(
                      key: UniqueKey(),
                      fd: i,
                      textField: snapshot.data[index].description,
                      currentTime: DateTime.now(),
                      //onRemoved: FeedMainPage.removeFeed,
                      //onFeedEdit: FeedMainPage.editFeed,
                      //context: context,
                    );
                  });
            }),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF68DA6C)
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final a = Offset(size.width * 0.01, size.height * 0.15);
    final b = Offset(size.width * 0.99, size.height * 0.63);
    final c = Offset(size.width * 0.01, size.height * 0.45);
    final d = Offset(size.width * 0.99, size.height * 0.9);
    var radius = const Radius.circular(50);

    final rect = Rect.fromPoints(a, b);
    final rect2 = Rect.fromPoints(c, d);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    canvas.drawRect(rect2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
