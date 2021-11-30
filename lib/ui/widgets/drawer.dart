import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurDrawer extends StatelessWidget {
  OurDrawer({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {

    // print(user);
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
          onTap: () => user == null ? Navigator.pushNamed(context, '/login') : Navigator.pushNamed(context, '/profile'),
          child:DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child:user != null ? authorized(user!) : nonAuthorized(context),

          )),
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
  Widget authorized(User user) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: (user.photoURL != null) ?  CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL.toString()),
            radius: 50.0,
          ) : const Icon(Icons.account_circle_sharp, size: 100,),
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
            user.email.toString(),
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 11
            ),
          ),
        ),
      ],
    );
  }
  Widget nonAuthorized(BuildContext context) {
    return  Stack(
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
        );
  }
}


