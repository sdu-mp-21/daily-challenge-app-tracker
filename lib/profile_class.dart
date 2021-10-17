import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(
  const Directionality(
    textDirection: TextDirection.ltr,
    child: Center(
        child: MyMainWidget()
    ),
  ),
);

class MyMainWidget extends StatelessWidget{
  const MyMainWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Center (
        child: BigColumn(),
        //color: Colors.blue,
        //padding: EdgeInsets.all(20),
      ),
    );
  }

}

class BigColumn extends StatelessWidget {
  const BigColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Center (
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Imagination(),
              SmallColumn(),
              NumbRow(),
            ]
        ),
        //color: Colors.blue,
        //padding: EdgeInsets.all(20),
      ),
    );

  }
}



class Imagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return const Center(
      child: Expanded(
        child: FittedBox(
          fit: BoxFit.contain, // otherwise the logo will be tiny
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

//Numb not all
class NumbRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return Row(
      children:const <Widget>[
        Expanded(
          child: Text('Challenges today: \n 0', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Habits today: \n 0', textAlign: TextAlign.center),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}

class SmallColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('NickName: SSurikkiller', textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic)),
          Text('ID: 190107046', textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic)),
          Text('Email: SSurikkiller@mail.ru',textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic))
        ],
      ),
    );
  }
}