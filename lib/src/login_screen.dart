import 'package:pictora/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pictora/src/register_user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          // color: Colors.accents,
          padding: EdgeInsets.all(15),
          child: Form(
            key: _registerFormKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username"
                  ),
                  controller: _usernameController,

                ),
                TextFormField(

                  decoration: InputDecoration(
                    hintText: "Password"
                  ),
                  controller: _passwordController,
                  
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("SignIn"),
                  onPressed: (){
                    // print();
                    validate();
                  },
                ),
                SizedBox(height: 20,),
                GestureDetector(
                                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "create new account", style: TextStyle(color: Colors.black))
                      ]
                    ),
                  ),
                  onTap: (){
                    Fluttertoast.showToast(msg: "User ${_usernameController.text} registered successfully!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterUser()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate()async{
    if(_registerFormKey.currentState.validate()){
      print("IN");
      final FirebaseAuth _auth = FirebaseAuth.instance;

      try{
        AuthResult result =  await _auth.signInWithEmailAndPassword(
                    email: _usernameController.text, 
                    password: _passwordController.text);
        print(result);
        if(result.user != null){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      }catch(e){
        print(e);
      }
    }
  }
}