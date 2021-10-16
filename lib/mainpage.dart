import 'package:flutter/material.dart';
import 'models/textfield.dart';
import 'models/userinfo.dart';
import 'models/like.dart';
import 'models/view.dart';
class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: const Color(0xff0F0F13),
          child: ListView(
            children: [
              SizedBox(

                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 24.0,

                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 5.0,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 24.0,
                          ),
                          child: Userinfo()
                      ),
                      Textfield(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 124.0,
                            ),
                            child: Views(),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(

                                left: 64.0,
                              ),
                              child: Like()
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
