
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pictora/src/task_one/screens/home_screen.dart';
import 'package:pictora/src/task_one/screens/register_user.dart';

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
                // SizedBox(height: 200),
                Container(
                  height: 250,
                  child: Center(child: Text("Login", style: TextStyle(fontSize: 50),),),
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                    hintText: 'Username',
                    labelText: 'Username'
                  ),
                  controller: _usernameController,

                ),
                SizedBox(height: 20),
                TextFormField(

                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                    hintText: 'Password',
                    labelText: 'Password'
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
          Fluttertoast.showToast(msg: "Logged In successfully!");
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