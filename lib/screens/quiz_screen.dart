import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int secondsLeft = 10;
  Timer? timer;
  bool answered = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer?.cancel();
    setState(() {
      secondsLeft = 10;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft <= 1) {
        t.cancel();
        _goToNextQuestion();
      } else {
        setState(() {
          secondsLeft -= 1;
        });
      }
    });
  }

  void _selectAnswer(int index) {
    if (answered) return;
    setState(() {
      answered = true;
    });
    final question = kQuestions[currentQuestionIndex];
    if (index == question.correctIndex) {
      score += 1;
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      _goToNextQuestion();
    });
  }

  void _goToNextQuestion() {
    timer?.cancel();
    if (currentQuestionIndex + 1 < kQuestions.length) {
      setState(() {
        currentQuestionIndex += 1;
        answered = false;
      });
      _startTimer();
    } else {
      Navigator.pushReplacementNamed(
        context,
        ResultScreen.routeName,
        arguments: ResultArgs(score: score, total: kQuestions.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = kQuestions[currentQuestionIndex];
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentQuestionIndex + 1}/${kQuestions.length}'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(child: Text('Time: $secondsLeft s')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ...List.generate(question.options.length, (i) {
              final isCorrect = i == question.correctIndex;
              Color? bg;
              if (answered) {
                if (isCorrect) {
                  bg = Colors.green.shade200;
                }
              }
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bg,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: answered ? null : () => _selectAnswer(i),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(question.options[i]),
                  ),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: color.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Score: $score'),
                ),
                TextButton(
                  onPressed: _goToNextQuestion,
                  child: const Text('Skip'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


