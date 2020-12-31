import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

// Text Field Widget Template
class DetailsField extends StatelessWidget {

  DetailsField(this.labelText, this.fieldIcon);

  final String labelText;
  final IconData fieldIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.green,
              width: 1.5,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
        icon: Icon(
          fieldIcon,
          color: Colors.red,
        ),
      ),
    );
  }
}

// Progress Bar Template Widget
class ProgBar extends StatefulWidget {
  @override
  _ProgBarState createState() => _ProgBarState();
}

class _ProgBarState extends State<ProgBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: FAProgressBar(
        currentValue: 100,
        maxValue: 100,
        displayText: null,
        progressColor: Colors.red,
        borderRadius: 20,
        size: 15,
        border: Border.all(
          color: Colors.red,
          width: 1,
        ),
        animatedDuration: Duration(seconds: 1),
      ),
    );
  }
}

// Details Heading Template Widget
class DetailsHeading extends StatelessWidget {

  DetailsHeading(this.headingText);

  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        headingText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }
}