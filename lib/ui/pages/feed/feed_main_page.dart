import '../add_challenge.dart';
import 'feed_creator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FeedMainPage extends StatefulWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  _FeedMainPageState createState() => _FeedMainPageState();
}

class _FeedMainPageState extends State<FeedMainPage> {
  final CreateNewWidget addWidget = CreateNewWidget(page: 1);
  final DateTime time = DateTime.now();
  final  _user = FirebaseAuth.instance.currentUser;
  String _userName = 'User Name';
  String _photoURL = "";
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
        stream: FirebaseFirestore.instance.collection('feeds').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {

          if(!snapshot.hasData) return const Text("нет записи");
          if(_user != null){
            _userName =
            (_user?.displayName != null) ? _user!.displayName.toString() : "";
            _photoURL = (_user?.photoURL != null) ? _user!.photoURL.toString() : "";
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var i = snapshot.data!.docs[index].id;
                addWidget.fd = i;
                return FeedCreator(
                  key: UniqueKey(),
                  userName: _userName,
                  userPhotoUrl: _photoURL,
                  fd: i,
                  textField: snapshot.data!.docs[index].get('description'),
                  currentTime: DateTime.now(),
                );
              });
        },
      ),
    );
  }
}


/*
 ! FutureBuilder(
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
                    );
                  });
            })*/


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
