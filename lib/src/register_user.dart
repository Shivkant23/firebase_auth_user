import 'package:pictora/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegisterUser extends StatefulWidget {
  RegisterUser({Key key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                child: Text("Register"),
                onPressed: (){
                  // print();
                  validate();
                },
              ),
              SizedBox(height: 20,),
            ],
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
        AuthResult result =  await _auth.createUserWithEmailAndPassword(
                    email: _usernameController.text, 
                    password: _passwordController.text);
        print(result);
        if(result.user != null){
          Fluttertoast.showToast(msg: "User ${_usernameController.text} registered successfully!");
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //   );
        }
      }catch(e){
        print(e);
      }
    }
  }
}