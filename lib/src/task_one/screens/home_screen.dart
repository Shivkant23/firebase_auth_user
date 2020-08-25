import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
       appBar: AppBar(title: Text("HomePage"),),
       body: Container(
         child: Center(child: Text("Account is acuthenticated!"),),
       ),
    );
  }

  getDrawer(BuildContext context){
     return Drawer(
       child: ListView(
         children: <Widget>[
           DrawerHeader(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 CircleAvatar(
                  radius: 40,
                  child: FittedBox(
                    child: Icon(Icons.account_circle, size: 110,),
                  ),
                 ),
                 SizedBox(height: 10),
                 Text("Shivkant R Sawarkar"),
               ],
             ),
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: <Color>[
                   Color(0xFF30BDC6),
                   Color(0xFF00A4EC),
                 ],
               ),
             ),
           ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.launch),
              onTap: (){
                logout();
              },
            ),
            ListTile(
              title: Text("Coindesk Graph 1"),
              trailing: Icon(Icons.group),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bitcoingraphone');
              },
            ),
            ListTile(
              title: Text("Coindesk Graph 2"),
              trailing: Icon(Icons.group),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bitcoingraphtwo');
              },
            ),
            ListTile(
              title: Text("Coindesk Graph 3"),
              trailing: Icon(Icons.group),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bitcoingraphthree');
              },
            ),
         ],
       ),
     );
   }

   void logout()async{
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}