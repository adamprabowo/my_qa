import 'package:flutter/material.dart';

import '../screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D046E),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/images/icon-circle.png'),
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              Text(
                'Quiz',
                style: TextStyle(
                  color: Color(0xFFA20CBE),
                  fontSize: 90.0,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'PLAY',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  color: Color(0xFFFFBA00),
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pushNamed(QuizScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
