import '../add_challenge.dart';
import 'feed_creator.dart';
import 'package:flutter/material.dart';
import  'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  final CreateNewWidget addWidget = CreateNewWidget(page: 1);
  final DateTime time = DateTime.now();

  Widget createPostBtn() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: CustomPaint(
        painter: CurvePainter(),
        child: const Center(
            child: Text('Create Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ))),
      ),
    );
  }

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFireBase();
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
            child: createPostBtn()),
      ),
      //color: const Color(0xfff1f1f1),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('feeds')
            .orderBy('time_ago', descending: true)
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if (snapshot.hasError) {
            return const Center(child:  Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }
          if(!snapshot.hasData) return const Center(child: Text("нет записи"));

          return ListView.builder(

              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var i = snapshot.data!.docs[index].id;
                addWidget.fd = i;
                return FeedCreator(
                  key: UniqueKey(),
                  userName: snapshot.data!.docs[index].get('username'),
                  userPhotoUrl: snapshot.data!.docs[index].get('photoURL'),
                  fd: i,
                  textField: snapshot.data!.docs[index].get('description'),
                  currentTime: snapshot.data!.docs[index].get('time_ago'),
                  context: snapshot.data!.docs[index].get('context')
                );
              });
        },
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
