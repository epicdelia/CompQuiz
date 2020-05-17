import 'question.dart';

int _questionNumber = 0;
bool end = false;

class Quiz {
  List<Question> _questions = [
    Question('Information after // is not read by the compiler', true),
    Question('All strings have a length and the first index is 1', false),
    Question('The value stored in a constant can be changed later in a program',
        false),
    Question('A method of void does not have a return value', true)
  ];

  bool quizEnded() {
    return (_questionNumber >= _questions.length - 1);
  }

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].answer;
  }
}
