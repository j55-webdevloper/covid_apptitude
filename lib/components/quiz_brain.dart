import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('The required social distancing between yourself and others does not need to be greater than 0.5m.', false, 'quiz_1.png'),
    Question('Getting the vaccine for pneumonia can protect you against contracting the coronavirus.', false, 'quiz_2.png'),
    Question('Spraying chemical alcohol or chlorine all over your body can kill COVID-19.', false, 'quiz_3.png'),
    Question('Hand wash is just as effective at killing germs and bacteria as hand sanitizer.', false, 'quiz_4.png'),
    Question('If you believe you have come in contact with someone who has the virus, you need to quarantine for at least 2 weeks.', true, 'quiz_5.png'),
    Question('Most people who get COVID­-19 will have a mild form of the illness and recover without needing professional medical care.', true, 'quiz_6.png'),
    Question('Older people and people with other health conditions, such as asthma, heart diseases and diabetes, are more at risk of getting seriously ill. ', true, 'quiz_7.png'),
  ];

  void nextQuestion() {
    if(_questionNumber < (_questionBank.length - 1)) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  String getImageName() {
    return _questionBank[_questionNumber].imageName;
  }

  bool isFinished() {
    if(_questionNumber >= (_questionBank.length - 1)) {
      return true;
    }
    else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}