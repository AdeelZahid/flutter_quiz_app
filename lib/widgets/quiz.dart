import 'package:flutter/material.dart';
import 'package:quizzler/widgets/buttons.dart';
import 'package:quizzler/providers/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userSelectAnswer) {
    bool correctAnswer = quizBrain.checkAnswer(userSelectAnswer);

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz .. \n Score ${quizBrain.totalScore()}',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else if (correctAnswer == userSelectAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
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

        Buttons(
          buttonColor: Colors.green,
          buttonText: 'True',
          onClick: () => checkAnswer(true),
        ),
        Buttons(
          buttonColor: Colors.red,
          buttonText: 'False',
          onClick: () => checkAnswer(false),
        ),
        //Todo : Add a row here as your score keeper

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
