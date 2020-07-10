import 'package:flutter/material.dart';
import 'package:my_qa/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D046E),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage('assets/images/icon-circle.png'),
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Quiz',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Color(0xFFA20CBE),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(QuizScreen.routeName);
                },
                color: Color(0xFFFFBA00),
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
