import 'package:flutter/material.dart';
import '../models/question.dart';
import 'home_screen.dart';

class ResultArgs {
  final int score;
  final int total;
  const ResultArgs({required this.score, required this.total});
}

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResultArgs?;
    final score = args?.score ?? 0;
    final total = args?.total ?? kQuestions.length;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              decoration: BoxDecoration(
                color: color.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '$score / $total',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreen.routeName,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}


