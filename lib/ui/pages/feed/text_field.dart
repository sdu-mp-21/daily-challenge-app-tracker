import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldCustom extends StatelessWidget {
  final dynamic text;
   const TextFieldCustom({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border:  Border(
         top: BorderSide(width: 0.0, color: Colors.grey),
         right: BorderSide(width: 0.0, color: Colors.grey),
         bottom: BorderSide(width: 2.0, color: Colors.grey),
         left: BorderSide(width: 0.0, color: Colors.grey),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child:  Text(
          text ?? 'No Text',
        textDirection: TextDirection.ltr,
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xff000080),
        ),

      ),
    );
  }
}
