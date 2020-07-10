import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D046E),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/images/icon.png'),
                ),
                Text('30'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
