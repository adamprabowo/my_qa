import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../helpers/quiz_helper.dart';
import '../screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  String apiURL = "https://opentdb.com/api.php?amount=10&category=18&type=multiple";

  QuizHelper quizData;

  int currentQuestion = 0;

  int totalSeconds = 30;
  int elapsedSeconds = 0;

  Timer timer;

  int score = 0;

  @override
  void initState() {
    fetchAllQuiz();
    super.initState();
  }

  fetchAllQuiz() async {
    var response = await http.get(apiURL);
    var body = response.body;

    var json = jsonDecode(body);

    setState(() {
      quizData = QuizHelper.fromJson(json);
      quizData.results[currentQuestion].incorrectAnswers.add(
          quizData.results[currentQuestion].correctAnswer
      );

      quizData.results[currentQuestion].incorrectAnswers.shuffle();

      initTimer();
    });
  }

  initTimer() {
    timer = Timer.periodic(
        Duration(seconds: 1),
            (t) {
          if(t.tick == totalSeconds) {
            print("Time completed");
            t.cancel();
            changeQuestion();
          } else {
            setState(() {
              elapsedSeconds = t.tick;
            });
          }
        }
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  checkAnswer(answer) {
    String correctAnswer = quizData.results[currentQuestion].correctAnswer;
    if(correctAnswer == answer) {
      score += 1;
    } else {
      print("Wrong");
    }
    changeQuestion();
  }

  changeQuestion() {
    timer.cancel();

    // check if it is last question
    if(currentQuestion == quizData.results.length - 1) {

      print("Quiz Completed");
      print("Score: $score");

      // navigate to result screen
      Navigator.of(context).pushNamed(ResultScreen.routeName, arguments: score);

    } else {

      setState(() {
        currentQuestion += 1;
      });

      quizData.results[currentQuestion].incorrectAnswers.add(
          quizData.results[currentQuestion].correctAnswer
      );

      quizData.results[currentQuestion].incorrectAnswers.shuffle();
      initTimer();
    }
  }

  @override
  Widget build(BuildContext context) {

    if(quizData != null) {
      return Scaffold(
        backgroundColor: Color(0xFF2D046E),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(
                        image: AssetImage(
                          "assets/images/icon-circle.png",
                        ),
                        width: 70,
                        height: 70,
                      ),
                      Text(
                        "$elapsedSeconds s",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),


                //question
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Q. ${quizData.results[currentQuestion].question}",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // options
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 40,
                  ),
                  child: Column(
                    children: quizData.results[currentQuestion].incorrectAnswers.map((option) {

                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: RaisedButton(
                          onPressed: (){
                            checkAnswer(option);
                          },
                          color: Color(0xFF511AA8),
                          colorBrightness: Brightness.dark,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );

                    }).toList(),
                  ),
                ),

              ],
            ),
          ),
        ),
      );

    } else {
      return Scaffold(
        backgroundColor: Color(0xFF2D046E),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

  }
}
