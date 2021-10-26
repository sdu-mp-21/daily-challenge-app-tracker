import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:math' as math;


class ShareBtn extends StatelessWidget {
  const ShareBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.centerLeft,
      transform: Matrix4.rotationY(math.pi),
      child: IconButton(
        iconSize: 30.0,
        color: Colors.grey,
        icon: const Icon(Icons.reply_all_rounded),
        onPressed: () {
          Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
        },
      ),
    );
  }
}

