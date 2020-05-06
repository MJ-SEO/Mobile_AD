import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                SizedBox(height: 16.0,),
                Image.asset('assets/bibim.png', scale: 3),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 120.0),
            Container(
                height: 60,
                color: Color.fromRGBO(255, 30, 30, 90),
                child: RaisedButton(
                  child: Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.white),
                    Text("      sign in google", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            SizedBox(height: 16.0),
            Container(
              height: 60,
              color: Color.fromRGBO(255, 255, 255, 90),
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.help, color: Colors.white),
                    Text("      sign in anonymous", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                ),
                  onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}