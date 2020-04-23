import 'package:flutter/material.dart';

class QuestionStatementWidget extends StatelessWidget {
  final String _questionText;

  QuestionStatementWidget(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        _questionText,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }
}
