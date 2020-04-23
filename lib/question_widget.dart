import 'package:flutter/material.dart';
import 'package:triviaapp/question_statement_widget.dart';
import 'package:triviaapp/questions.dart';

import 'answer_button.dart';

class QuestionWidget extends StatefulWidget {
  final List<Question> questions;
  final Function handleCorrectAnswer;
  final Function handleWrongAnswer;

  const QuestionWidget(
      {Key key,
      @required this.questions,
      @required this.handleCorrectAnswer,
      @required this.handleWrongAnswer})
      : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionIndex = 0;

  List<AnswerButton> _getAnswerButtons(Question question) {
    List<AnswerButton> buttons = [
      AnswerButton(question.correctAnswer, widget.handleCorrectAnswer)
    ];
    buttons.addAll(question.incorrectAnswers
        .map((answer) => AnswerButton(answer, widget.handleWrongAnswer)));
    buttons.shuffle();
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        QuestionStatementWidget(widget.questions[_questionIndex].question),
        ..._getAnswerButtons(widget.questions[_questionIndex]),
      ],
    );
  }
}
