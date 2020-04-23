import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String _answerText;
  final Function _selectAnswerHandler;

  AnswerButton(this._answerText, this._selectAnswerHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: RaisedButton(
        child: Text(_answerText),
        onPressed: _selectAnswerHandler,
      ),
    );
  }
}
