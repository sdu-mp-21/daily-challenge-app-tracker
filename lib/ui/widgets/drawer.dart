import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurDrawer extends StatelessWidget {
  OurDrawer({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    String? s = (user != null && user!.displayName != null) ? user!.displayName : 'Drawer Header';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange.shade300,
            ),
            child: Text(
              s!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {Navigator.pushNamed(context, '/privacyPolicy');},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {Navigator.pushNamed(context, '/profile');},
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

}