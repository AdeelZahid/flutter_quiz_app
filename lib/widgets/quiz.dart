import 'package:flutter/material.dart';
// import 'package:quizzler/model/question.dart';
import 'package:quizzler/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.checkAnswer();

    if (correctAnswer == userPickedAnswer) {
      print('Correct Anser');
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      print('Wrong Anser');
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              child: MaterialButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.green,
                onPressed: () => checkAnswer(true),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () => checkAnswer(false),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ),
        ),
        //Todo : Add a row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
