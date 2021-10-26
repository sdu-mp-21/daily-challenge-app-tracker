import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/pages/auth/registration_widget.dart';
import 'package:challenge_tracker/ui/widgets/buttons.dart';
import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 150,
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
                    _textInput(hint: "Email", icon: Icons.email),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Buttons.getAuthButton("LOGIN", () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegPage()));
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Colors.black,)
                        ),

                        TextSpan(
                            text: "Register",
                            style: TextStyle(color: ColorsCustom.orangeColors),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
            ,Authorization.getFooter(),
          ],
        ),
      ),
    );
  }

  Widget _textInput({hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}