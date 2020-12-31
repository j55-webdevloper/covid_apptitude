import 'package:flutter/material.dart';
import 'package:covid_apptitude/components/template_widgets.dart';
import 'package:covid_apptitude/screens/quiz_screen.dart';

class QuizLoadingScreen extends StatefulWidget {

  static String id = 'quiz_loading_screen';

  @override
  _QuizLoadingScreenState createState() => _QuizLoadingScreenState();
}

class _QuizLoadingScreenState extends State<QuizLoadingScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double scaleValue_2 = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.pushNamed(context, QuizScreen.id);
      }
    });

    animationController.addListener(() {
      setState(() {
        scaleValue_2 = animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Covid Apptitude',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  child: Transform.scale(
                    scale: scaleValue_2,
                    child: Image(
                      image: AssetImage('images/Asset 930.png'),
                    ),
                  ),
                ),
              ),
            ),
            ProgBar(),
          ],
        ),
      ),
    );
  }
}



