import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
// import 'package:challenge_tracker/ui/widgets/buttons.dart';
import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {


  late String _name;
  late String _email;
  late String _password;
  // late String _passwordAgain;

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

  Widget _buildEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Email',icon: new Icon(Icons.email)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email is Required';
          }
          if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }
          return null;
        },
        onSaved: (value) {
          _email = value!;
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



  Widget _buildPasswordAgain() {
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
          else if(value != _password){
            return 'The password does not match the pre-password';
          }

          return null;
        },
        // onSaved: (value) {
        //   _password = value!;
        // },
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight:130,
        flexibleSpace: Authorization.getHeader(),
      ),

      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Form(
                // margin: const EdgeInsets.only(left: 60, right: 60, top: 30),
                key: _formKey ,
                child: Column(
                  children: <Widget>[
                    _buildName(),
                    _buildEmail(),
                    _buildPassword(),
                    _buildPasswordAgain(),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom:20,left: 20,right: 20),

                      child: ElevatedButton(


                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          print(_name);
                          print(_email);
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
                          child: const Text('Register', style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold, letterSpacing: 2),),
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


}

