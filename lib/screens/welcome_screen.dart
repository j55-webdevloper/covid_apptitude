import 'package:covid_apptitude/components/template_widgets.dart';
import 'package:covid_apptitude/screens/symptom_checklist_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_string';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double scaleValue = 0;

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
        Navigator.pushNamed(context, SymptomChecklistScreen.id);
      }
    });

    animationController.addListener(() {
      setState(() {
        scaleValue = animationController.value;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300.0,
                width: 300.0,
                child: Transform.scale(
                  scale: scaleValue,
                  child: Image(
                    image: AssetImage('images/virus.png'),
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
