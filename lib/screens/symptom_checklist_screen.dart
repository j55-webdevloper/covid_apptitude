import 'package:covid_apptitude/components/template_widgets.dart';
import 'package:covid_apptitude/screens/quiz_loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SymptomChecklistScreen extends StatelessWidget {
  static String id = 'symptom_checklist_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Column(
          children: [
            DetailsHeading('Are you experiencing?'),
            SizedBox(height: 35.0),
            CheckboxWidget(),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizLoadingScreen.id);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.red,
                    width: 1.5,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  Map<String, bool> symptoms = {
    'Fever or chills': false,
    'Cough': false,
    'Shortness of breath': false,
    'Fatigue': false,
    'Muscle or body aches': false,
    'Headache': false,
    'Loss of taste or smell': false,
    'Sore throat': false,
    'Congestion or runny nose': false,
    'Nausea or vomiting': false,
    'Diarrhea': false,
  };

  var holder_1 = [];

  getItems() {
    symptoms.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: symptoms.keys.map((String key) {
          return new CheckboxListTile(
            title: Text(
              key,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
              ),
            ),
            value: symptoms[key],
            activeColor: Colors.red,
            onChanged: (bool value) {
              setState(() {
                symptoms[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
