import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Question {
  String questionText;
  List<String> answerOptions;
  int correctAnswerIndex;

  Question(
      {required this.questionText,
      required this.answerOptions,
      required this.correctAnswerIndex});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Question> _questions = [
    Question(
      questionText: 'What is the largest mammal in the world?',
      answerOptions: [
        'A. Elephant',
        'B. Blue Whale',
        'C. Giraffe',
        'D.Gorilla'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      answerOptions: ['A. Earth', 'B. Mars', 'C. Jupiter', 'D. Venus'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Mark tossed a fair coin ten times with each outcome always being a tail. Which of the following is true if he tosses the coin for the sixth time?',
      answerOptions: [
        'A.The outcome will most likely be a head',
        'B.The outcome will most likely be a tail',
        'C.There is an equal chance that the outcome is a head as it is a tail'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What are the people who live in baguio called?',
      answerOptions: [
        'A. Ibaloy',
        'B. Mangyan',
        'C. Badjao',
        'D. Aeta',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Who is the most prettiest actress in the philippines?',
      answerOptions: [
        'A. Liza Soberano',
        'B. kathryn Bernardo',
        'C. Julia Barreto',
        'D. Nadine Lustre',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the sound of the Goat?',
      answerOptions: [
        'A. Arf Arf',
        'B. Meee Meee',
        'C. Meow Meow',
        'D. Moo Moo',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Where is the Main Campus of Pangasinan State University?',
      answerOptions: [
        'A. Urdaneta',
        'B. Sta.Maria',
        'C. Asingan',
        'D. Lingayen',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Who is the leader of KKK Association?',
      answerOptions: [
        'A. Dr. Jose Rizal',
        'B. Andrés Bonifacio',
        'C. Bong Bong Marcos',
        'D. Rodrigo Duterte',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is my favorite ice cream flavor?',
      answerOptions: [
        'A. Cheese',
        'B. Vanilla',
        'C. Ube',
        'D. Cookies and Cream',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Do i have a Boyfriend?',
      answerOptions: [
        'A. OO',
        'B. WALA',
        'C. SECRET',
        'D. DEPENDE SA CHISMISS',
      ],
      correctAnswerIndex: 1,
    ),
  ];

  List<String> _correctAnswers = [
    'Blue Whale',
    'Mars',
    'There is an equal chance that the outcome is a head as it is a tail',
    'Ibaloy',
    'Kathryn Bernardo',
    'Mee Mee',
    'Lingayen',
    'Andrés Bonifacio',
    'Cheese',
    'OO',
  ];
  bool _showCorrectAnswer = false;

  void _checkAnswer(int selectedIndex) {
    int correctAnswerIndex =
        _questions[_currentQuestionIndex].correctAnswerIndex;
    if (selectedIndex == correctAnswerIndex) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _showCorrectAnswer = true;
    });

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(score: _score)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ..._questions[_currentQuestionIndex]
                .answerOptions
                .asMap()
                .entries
                .map(
              (entry) {
                int index = entry.key;
                String answerOption = entry.value;
                return ElevatedButton(
                  onPressed: () {
                    _checkAnswer(index);
                  },
                  child: Text(answerOption),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String getResultMessage() {
    if (score >= 9) {
      return 'Perfect!';
    } else if (score >= 6) {
      return 'That\'s good!';
    } else {
      return 'You failed.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              getResultMessage(),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Score: $score/10',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
