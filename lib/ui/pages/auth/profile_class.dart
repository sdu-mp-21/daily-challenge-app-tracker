import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          toolbarHeight: 138,
          flexibleSpace:  Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkTeyKKhCeXGhe_pdatQghtspNKST0BopZXA&usqp=CAU"
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),

        ),
        body: SafeArea(

          child: Column(

            children: [

              SizedBox(
                width: double.infinity,
                //height: 200,
                child: Container(
                  alignment: const Alignment(0.0,2.5),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "SMD.jpg"
                      //Image to profile
                    ),
                    radius: 60.0,
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              const Text(
                'Serik Syzdykov'
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Almaty, Kazakhstan"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mobile Developer"
                ,style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),

                  elevation: 2.0,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                      child: Text("Watch the news",style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300
                      ),))
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "NickName:SSurikkiller\nID: 190107046"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text("Challenges",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("5 today",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                      Expanded(
                        child:
                        Column(
                          children: const [
                            Text("Habits today",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("0",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}