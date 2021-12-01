//import 'package:challenge_tracker/ui/pages/add_challenge.dart';
import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/pages/auth/login_widget.dart';
import 'package:challenge_tracker/ui/pages/auth/privacy_policy.dart';
import 'package:challenge_tracker/ui/pages/auth/profile_class.dart';
import 'package:challenge_tracker/ui/pages/auth/provider/email_sign_in.dart';
import 'package:challenge_tracker/ui/pages/auth/settings_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'navigator_logged.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  static const String _title = '21 days Challenge';

  MainApp({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: user == null ? '/logged_out' : '/logged_in',
      routes: {
        '/logged_out': (context) => const MainPage(),
        '/logged_in': (context) => const MainPageLogged(),
        '/register': (context) =>  const Authorization(),
        '/login': (context) => const LoginPage(),
        '/privacyPolicy': (context) => const PrivacyPolicy(),
        '/settings': (context) => const SettingsPage(),
        '/profile': (context) => const ProfilePage(),
        //'/createChallenge': (context) => const CreateNewWidget(page: 0),
        //'/createPost': (context) => const CreateNewWidget(page: 1)
      },
    ),
  );
}






