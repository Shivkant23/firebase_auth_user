
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
      body: SingleChildScrollView(
              child: Container(
          // color: Colors.accents,
          padding: EdgeInsets.all(15),
          child: Form(
            key: _registerFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  child: Center(child: Text("Register", style: TextStyle(fontSize: 50),),),
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