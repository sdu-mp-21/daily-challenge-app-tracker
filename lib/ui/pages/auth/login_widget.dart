import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/pages/auth/firebase_authentication.dart';
// import 'package:challenge_tracker/ui/pages/auth/registration_widget.dart';
// import 'package:challenge_tracker/ui/widgets/buttons.dart';
import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late FireBaseAuthentication auth;
  String _message = '';
  bool _isLogin = true;
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FireBaseAuthentication();
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 115,
        flexibleSpace: Authorization.getHeader(),

      ),

      body: Container(
        padding: const EdgeInsets.only(bottom: 0),
        child: Column(

          children: <Widget>[

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 60, right: 60, top: 30),
                child: Column(
                  children: <Widget>[
                    //widget for userName input
                    _userNameInput(),
                    //widget for passWord input
                    _passwordInput(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child:  Text(
                        _isLogin ? "Forgot Password?" : "",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Text(_message),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))),
                          ),
                          onPressed: () {
                            String userId = '';
                            if(_isLogin) {
                              auth.login(txtUserName.text, txtPassword.text).then((value) {
                                if(value == null) {
                                  setState(() {
                                    _message = 'Login error';
                                  });
                                }
                                else {
                                  userId = value;
                                  setState(() {
                                    _message = 'User $userId successfully signed in';
                                  });
                                }
                              });
                            }
                            else {
                              auth.createUser(txtUserName.text, txtPassword.text).then((value) {
                                if(value == null) {
                                  setState(() {
                                    _message = 'Registration Error!';

                                  });
                                }
                                else {
                                  userId = value;
                                  setState(() {
                                    _message = 'User $userId successfully signed in';
                                  });
                                }
                              });
                            }
                          },
                          child: Text(_isLogin ? "LOGIN" : "REGISTER", style: const TextStyle(fontSize: 18),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: _isLogin ? "Don't have an account?" : "Already a member?",
                              style: const TextStyle(color: Colors.black,)
                          ),

                          TextSpan(
                            text: _isLogin ? "Register" : "Login",
                            style: TextStyle(color: ColorsCustom.orangeColors),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
            // ,Authorization.getFooter(),
          ],
        ),
      ),
    );
  }

  Widget _userNameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: txtUserName,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          prefixIcon: Icon(Icons.verified_user),
        ),
        validator: (text) => text!.isEmpty ? 'User Name is required' : '',
      ),
    );
  }
  Widget _passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: txtPassword,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          prefixIcon: Icon(Icons.enhanced_encryption),
        ),
        validator: (text) => text!.isEmpty ? 'Password is required' : '',
      ),
    );
  }
}