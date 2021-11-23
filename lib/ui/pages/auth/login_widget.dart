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

  late String _name;
  late String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 40,right: 40),
      child:TextFormField(
        decoration: InputDecoration(labelText: 'Name',icon: new Icon(Icons.person)),
        maxLength: 16,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (value) {
          _name = value!;
        },
      ),
    );
  }



  Widget _buildPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 40,right: 40),
      child:TextFormField(
        decoration: InputDecoration(labelText: 'Password',icon: new Icon(Icons.vpn_key)),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is Required';
          }else if(value.length < 6){
            return 'Password must be more than 6 characters';
          }

          return null;
        },
        onSaved: (value) {
          _password = value!;
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        
        toolbarHeight: 150,
        flexibleSpace: Authorization.getHeader(),

      ),

      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(

          children: <Widget>[


            Expanded(
              child: Form(
                key:_formKey,
               // margin: const EdgeInsets.only(left: 60, right: 60, top: 30),
                child: Column(
                  children: <Widget>[
                    _buildName(),
                    _buildPassword(),
                    const SizedBox(height:50),
                 //   _textInput(hint: "Email", icon: Icons.email),
                 //   _textInput(hint: "Password", icon: Icons.vpn_key),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom:20,left: 20,right: 20),

                      child: ElevatedButton(


                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          print(_name);
                          print(_password);


                          //Send to API
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(ColorsCustom.orangeColors),
                        ),
                        child: Container(
                          height: 40,
                          color: ColorsCustom.orangeColors,
                          alignment: Alignment.center,
                          child: const Text('Login', style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold, letterSpacing: 2),),
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
