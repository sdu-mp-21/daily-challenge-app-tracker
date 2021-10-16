import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,

          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: const Text(
        'Lorem Ipsum is simply dummy text of the printing '
            'and typesetting industry. Lorem Ipsum has been '
            'the industrys standard dummy text ever since the'
            ' 1500s, when an unknown printer took a galley of ',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
