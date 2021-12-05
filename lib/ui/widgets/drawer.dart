import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class OurDrawer extends StatefulWidget {
  const OurDrawer({Key? key}) : super(key: key);

  @override
  _OurDrawerState createState() => _OurDrawerState();
}

class _OurDrawerState extends State<OurDrawer> {
  final user = FirebaseAuth.instance.currentUser;
  late File _image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () => user == null ? Navigator.pushNamed(context, '/login') : Navigator.pushNamed(context, '/profile'),
            child:user != null ? authorized(user!, context) : nonAuthorized(context),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {Navigator.pushNamed(context, '/privacyPolicy');},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {Navigator.pushNamed(context, '/settings');},
          ),


        ],
      ),
    );
  }

  Widget authorized(User user, BuildContext context) {


    // print(user!.photoURL);
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: (user.photoURL != null) ?  CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL.toString()),
              radius: 50.0,
            )
                : GestureDetector(
              onTap: () {
                _showSelectionDialog(context);
              },
              child: const CircleAvatar(
                child: Icon(Icons.camera_alt),
                radius: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight + const Alignment(0, -.2),
            child: Text(
              user.displayName.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Align(
            alignment: Alignment.centerRight + const Alignment(0, .1),
            child: Text(
              user.email.toString(), style: const TextStyle(
                color: Colors.white70,
                fontSize: 11
            ),
            ),
          ),
        ],
      ),

    );

  }
  Widget nonAuthorized(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child:Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.account_circle_sharp, size: 100,),
          ),
          Align(
            alignment: Alignment.centerRight + const Alignment(0, -.1),
            child: Text(
              'login/register'.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ],
      ),

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



