import 'package:flutter/material.dart';

class Views extends StatelessWidget {
  const Views({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Views',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,

        ),
      ),
    );
  }
}