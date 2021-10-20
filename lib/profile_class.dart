import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(StaticApp());
class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMainWidget(),
    );
  }
}

class MyMainWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
        backgroundColor: Colors.deepOrange,
        title: Text('Here is your profile!'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: BigColumn(),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text("Something here!"),
          ),
        ),
      ),
    );
  }

}

class BigColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return Container(
        color: Colors.limeAccent,
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
      );


  }
}



class Imagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return Center(
          child: _buildthis(),
    );
  }
  Widget _buildthis(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff7c94b6),
        image: const DecorationImage(
          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),

      ),
    );
  }
  // Widget _buildShinyCircle() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       gradient: RadialGradient(
  //         colors: [
  //           Colors.lightBlueAccent,
  //           Colors.blueAccent,
  //         ],
  //         center: Alignment(-0.3, -0.5),
  //       ),
  //       boxShadow: [
  //         BoxShadow(blurRadius: 20),
  //       ],
  //     ),
  //   );
  // }
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