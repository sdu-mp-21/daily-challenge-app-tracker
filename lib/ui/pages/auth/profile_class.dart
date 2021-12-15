import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {
  final user = FirebaseAuth.instance.currentUser;
  late File _image;

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
                  child: (user!.photoURL != null) ?  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL.toString()),
                    radius: 60.0,
                  )
                  :GestureDetector(
                      onTap: () {
                        _showSelectionDialog(context);
                      },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera_alt),
                      radius: 50.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              Text(
                  user!.displayName.toString(),
                  style: const TextStyle(
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

  _showSelectionDialog(BuildContext context) {

    showModalBottomSheet(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                    child: Text('Select Source', style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pickPhoto(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.collections_outlined, color: Colors.white, size: 40,),
                            Text('Gallery', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pickPhoto(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.camera_alt_rounded, color: Colors.white, size: 40,),
                            Text('Camera', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      )
                    ],
                  )
                ]
            ),

          );
        });

  }
  Future<void> _pickPhoto(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if(pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }

    if(_image != null) {
      String fileName = basename(user!.uid);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('avatars/$fileName');
      UploadTask uploadTask = ref.putFile(_image);
      uploadTask.then((res) async {
        res.ref.getDownloadURL().then(
                (value) async {
              await FirebaseAuth.instance.currentUser!.updatePhotoURL(value);
            } );
      });
    }



  }

}