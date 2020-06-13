import 'package:delivery_app/firebase_services/authentication.dart';
import 'package:delivery_app/screens/client/home.dart';
import 'package:delivery_app/screens/client/search.dart';
import 'package:delivery_app/screens/start.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();

}
class _LoginState extends State<Login> {

  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _errorMessage; 
  bool isShowPassword = false;

  @override
  void initState() {
    super.initState();
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Pleaes enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Please enter a valid email address';
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
    });
    
    if (validateAndSave()) {
      String userId = "";
      try {
        userId = await Auth().signIn(_email, _password);
        setState(() {
          // _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          //save user info in SessionManager (SharedPreference)
          print("user");
          var user = await Auth().getUserInfo(userId);
          print(user);
          // SessionManager.saveUserInfoToLocal(user);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Start()));
        }
      } catch (e) {
        setState(() {
          // _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/beach.png", fit: BoxFit.cover),
          ),

          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset("assets/images/logo.png", ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25,),
                  padding: EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 5,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom:15),
                          child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 25,),),
                        ),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontFamily: 'Roboto Reqular',
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person, color: Color.fromRGBO(184, 178, 178, 1)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    hintText: "username",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto Reqular',
                                      color: Color.fromRGBO(131, 106, 66, 1),
                                    ),
                                  ),
                                  validator: _validateEmail,
                                  onSaved: (value) => _email = value.trim(),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                child: TextFormField(
                                  obscureText: !isShowPassword,
                                  style: TextStyle(
                                    fontFamily: 'Roboto Reqular',
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(184, 178, 178, 1)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto Reqular',
                                      color: Color.fromRGBO(131, 106, 66, 1),
                                    )
                                  ),
                                  validator: (value) =>
                                    value.isEmpty ? 'Password can\'t be empty' : null,
                                  onSaved: (value) => _password = value.trim(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Text("show password", style: TextStyle(color: Color.fromRGBO(219, 206, 190, 1),),),
                              Switch(
                                value: isShowPassword,
                                onChanged: (value) {
                                  setState(() {
                                    isShowPassword = value;
                                  });
                                },
                                activeTrackColor: Color.fromRGBO(221, 208, 192, 1),
                                activeColor: Colors.white,
                              ),

                              Text("Forgot password?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:15, right: 15, bottom: 20),
                          child: MaterialButton(
                            onPressed: validateAndSubmit,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Roboto Medium',
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            color: Color.fromRGBO(221, 208, 192, 1),
                            elevation: 0,
                            minWidth: 150,
                            height: 40,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("or login with:", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(FontAwesomeIcons.facebook, color: Color.fromRGBO(184, 178, 178, 1),),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(FontAwesomeIcons.twitter, color: Color.fromRGBO(184, 178, 178, 1),),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(FontAwesomeIcons.googlePlus, color: Colors.white,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
