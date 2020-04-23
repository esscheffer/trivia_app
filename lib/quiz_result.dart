import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final int _resultScore;
  final int _totalQuestions;
  final Function _handleResetQuiz;

  QuizResult(this._resultScore, this._totalQuestions, this._handleResetQuiz);

  String get _resultPhrase {
    return "Your score is $_resultScore/$_totalQuestions";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _resultPhrase,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text("Restart Quiz"),
            onPressed: _handleResetQuiz,
          )
        ],
      ),
    );
  }
}
