import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/quiz_loading_screen.dart';
import 'screens/symptom_checklist_screen.dart';
import 'screens/quiz_screen.dart';

void main() => runApp(CovidApptitude());

class CovidApptitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SymptomChecklistScreen.id: (context) => SymptomChecklistScreen(),
          QuizLoadingScreen.id: (context) => QuizLoadingScreen(),
          QuizScreen.id: (context) => QuizScreen(),
        }
    );
  }
}


