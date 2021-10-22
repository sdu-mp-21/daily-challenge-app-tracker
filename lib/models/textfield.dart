import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class Textfield extends StatefulWidget {
   dynamic text;

    Textfield({Key? key, this.text}) : super(key: key);

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
   dynamic readMore = '...read more', less = 'less';

   Widget readMoreWidget () {

     return  ReadMoreText(
       widget.text ?? 'No Text',
       textAlign: TextAlign.justify,
       trimLines: 3,
       colorClickableText: Colors.grey,
       trimMode: TrimMode.Line,
       trimCollapsedText: readMore,
       trimExpandedText: less,
       moreStyle: const TextStyle(
         fontSize: 16.0,
         fontWeight: FontWeight.w500,
         fontStyle: FontStyle.italic,
         color: Colors.grey,
       ),
       lessStyle: const TextStyle(
         fontSize: 16.0,
         fontWeight: FontWeight.w500,
         fontStyle: FontStyle.italic,
         color: Colors.grey,
       ),


       style:  GoogleFonts.lato(
         fontSize: 22,
         fontWeight: FontWeight.w600,
         color: const Color(0xff000080),
       ),

     );
   }

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: const BoxDecoration(
        border:  Border(
         top: BorderSide(width: 0.0, color: Colors.transparent),
         right: BorderSide(width: 0.0, color: Colors.transparent),
         bottom: BorderSide(width: 2.0, color: Colors.grey),
         left: BorderSide(width: 0.0, color: Colors.transparent),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: readMoreWidget(),
    );
  }
}
