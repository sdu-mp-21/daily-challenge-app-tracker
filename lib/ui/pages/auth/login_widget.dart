import 'package:challenge_tracker/ui/pages/auth/auth_page.dart';
import 'package:challenge_tracker/ui/pages/auth/provider/email_sign_in.dart';
import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _message = '';
  bool _isLogin = true;
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                child: Form(
                  key: _formKey,
                child: Column(
                  children: <Widget>[
                    //widget for userName input
                    if (!_isLogin) buildUsernameField(),
                    //widget for email input
                    _emailInput(),
                    //widget for passWord input
                    _passwordInput(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child:  Text(
                        _isLogin ? "Forgot Password?" : "",
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))),
                          ),
                          onPressed: () => submit(),
                          // onPressed: () {
                          // String userId = '';
                          // if(_isLogin) {
                          //   auth.login(txtUserName.text, txtPassword.text).then((value) {
                          //     if(value == null) {
                          //       setState(() {
                          //         _message = 'Login error';
                          //       });
                          //     }
                          //     else {
                          //       userId = value;
                          //       String s;
                          //       if(value.substring(0,2) == 'No' || value.substring(0,2) == 'Wr') {
                          //         s = userId;
                          //       }
                          //       else {
                          //         s = 'User $userId successfully signed in';
                          //       }
                          //       setState(() {
                          //         _message = s;
                          //       });
                          //     }
                          //   });
                          // }
                          // else {
                          //   auth.createUser(txtUserName.text, txtPassword.text).then((value) {
                          //     if(value == null) {
                          //       setState(() {
                          //         _message = 'Registration Error!';
                          //
                          //       });
                          //     }
                          //     else {
                          //       userId = value;
                          //       String s;
                          //       if(value.substring(0,3) == 'The') {
                          //         s = userId;
                          //       }
                          //       else {
                          //         s = 'User $userId successfully signed in';
                          //       }
                          //       setState(() {
                          //         _message = s;
                          //       });
                          //     }
                          //   });
                          // }
                          // },
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
                                final provider = Provider.of<EmailSignInProvider>(context, listen: false);
                                provider.isLogin = !provider.isLogin;
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

                )

              ),
            )
            // ,Authorization.getFooter(),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        key: const ValueKey('email'),
        controller: txtUserName,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          prefixIcon: Icon(Icons.verified_user),
        ),
        validator: (text) => text!.isEmpty ? 'User Name is required' : null,
        onSaved: (email) => provider.userEmail = email!,
      ),
    );
  }
  Widget _passwordInput() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        key: const ValueKey('password'),
        controller: txtPassword,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          prefixIcon: Icon(Icons.enhanced_encryption),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 7) {
            return 'Password must be at least 7 characters long.';
          } else {
            return null;
          }
        },
        onSaved: (password) => provider.userPassword = password!,
      ),
    );
  }

  Future submit() async {
    final provider = Provider.of<EmailSignInProvider>(context, listen: false);


    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    print(isValid);

    if (isValid) {
      _formKey.currentState!.save();

      final isSuccess = await provider.login();

      if (isSuccess == 'true') {
        Navigator.of(context).pop();
      } else {
        _message = isSuccess == 'false' ? 'An error occurred, please check your credentials!' : isSuccess;

        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text(_message),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }

  }

  Widget buildUsernameField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('username'),
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: (value) {
        if (value!.isEmpty || value.length < 4 || value.contains(' ')) {
          return 'Please enter at least 4 characters without space';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(labelText: 'Username'),
      onSaved: (username) => provider.userName = username!,
    );
  }
}