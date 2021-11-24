import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/material.dart';
import 'package:challenge_tracker/ui/pages/auth/registration_widget.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  static Widget getHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsCustom.orangeColors, ColorsCustom.orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          ),
      child:Container(
        child: const Image(
            height: 100,
            width: 100,
          image: AssetImage(
          'assets/images/mental.png')
        ),
        alignment: Alignment.center,
      ),
    );

  }

  static Widget getFooter() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsCustom.orangeColors, ColorsCustom.orangeLightColors],
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)
          )),
    );
  }

  @override
  State<StatefulWidget> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return const RegPage();
  }
}