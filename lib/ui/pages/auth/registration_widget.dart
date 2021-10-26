import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/widgets/buttons.dart';
import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 150,
        flexibleSpace: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorsCustom.orangeColors, ColorsCustom.orangeLightColors],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter),

          ),
          child:Container(
            child: Image.network(
              'assets/images/mental.png',height: 120,width: 120,
            ),
            alignment: Alignment.center,
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 60, right: 60, top: 30),
                child: Column(
                  children: <Widget>[
                    _textInput(hint: "Fullname", icon: Icons.person),
                    _textInput(hint: "Email", icon: Icons.email),
                    _textInput(hint: "Phone Number", icon: Icons.call),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    Expanded(
                      child: Center(
                        child: Buttons.getAuthButton(
                          "REGISTER", (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black,
                                letterSpacing: 2)),
                        TextSpan(
                            text: "Login",
                            style: TextStyle(color: ColorsCustom.orangeColors),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                                    Navigator.pushNamed(context, '/login');
                                },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _textInput({hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
