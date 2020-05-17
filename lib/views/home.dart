import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  Icon addIcon(Icon i) {
    scoreKeeper.add(i);
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = brain.getQuestionAnswer();
    setState(() {
      if (brain.quizEnded() == true) {
        Alert(context: context, title: "FINISHED QUIZ", desc: "Great job!")
            .show();
        brain.reset();
        scoreKeeper = [];
      } else {
        if (userAnswer == correctAnswer) {
          addIcon(Icon(Icons.check, color: Colors.green));
        } else {
          addIcon(Icon(Icons.close, color: Colors.red));
        }
        brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        brain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.lightGreen,
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      color: Colors.redAccent,
                      child: Text(
                        'False',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                    ),
                  ),
                ),
                Row(
                  children: scoreKeeper,
                )
              ],
            )),
      ),
    );
  }
}
