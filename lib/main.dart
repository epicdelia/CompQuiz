import 'package:compquiz/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

Quiz brain = Quiz();
void main() => runApp(QuizMain());

class QuizMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
