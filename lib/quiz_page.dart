import 'package:flutter/material.dart';
import 'package:triviaapp/answer_button.dart';
import 'package:triviaapp/question_widget.dart';
import 'package:triviaapp/questions.dart';
import 'package:triviaapp/quiz_result.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = getQuestions();

  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestionCorrect() {
    setState(() {
      _score++;
    });
    _answerQuestion();
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _questionIndex < questions.length
          ? QuestionWidget(
              questions: questions,
              handleCorrectAnswer: _answerQuestionCorrect,
              handleWrongAnswer: _answerQuestion)
          : QuizResult(_score, questions.length, _resetQuiz),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
