import 'package:flutter/material.dart';

import 'package:pictora/src/splash_screen.dart';
import 'package:pictora/src/task_one/screens/home_screen.dart';
import 'package:pictora/src/task_one/screens/login_screen.dart';
import 'package:pictora/src/task_one/screens/register_user.dart';
import 'package:pictora/src/task_two/gragh_screen_one.dart';
import 'package:pictora/src/task_two/gragh_screen_two.dart';
import 'package:pictora/src/task_two/gragh_screen_three.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
      routes: {
        '/dashboard': (context) => HomePage(),
        '/login' : (context) => LoginScreen(),
        '/register': (context) => RegisterUser(),
        '/bitcoingraphone': (context) => BitCoinGraphOne(),
        '/bitcoingraphtwo': (context) => BitCoinGraphTwo(),
        '/bitcoingraphthree': (context) => BitCoinGraphThree(),
      },
    );
  }
}