import 'package:covid_apptitude/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:covid_apptitude/components/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatelessWidget {

  static String id = 'quiz_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
          ),
        ],
        backgroundColor: Colors.red,
        title: Text(
          'Covid Apptitude',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
      body: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int scoreCount = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer =  quizBrain.getCorrectAnswer();

    setState(() {

      if(quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'QUIZ OVER',
          desc: 'Your scored is $scoreCount/7',
          buttons: [
            DialogButton(
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                },
            ),
          ]
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      else {
        if(userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          scoreCount++;
        }
        else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: 250.0,
                  child: Image(
                    image:  AssetImage('images/' + quizBrain.getImageName()),
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
         Expanded(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 height: 80.0,
                 width: 80.0,
                 child: FittedBox(
                   child: FloatingActionButton(
                     heroTag: 'True Button',
                     onPressed: () {
                       checkAnswer(true);
                     },
                     child: Icon(
                       Icons.done,
                     ),
                     backgroundColor: Colors.green,
                   ),
                 )
               ),
               Container(
                   height: 80.0,
                   width: 80.0,
                   child: FittedBox(
                     child: FloatingActionButton(
                       heroTag: 'False Button',
                       onPressed: () {
                         checkAnswer(false);
                       },
                       child: Icon(
                         Icons.close,
                       ),
                       backgroundColor: Colors.red,
                     ),
                   ),
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }

}

