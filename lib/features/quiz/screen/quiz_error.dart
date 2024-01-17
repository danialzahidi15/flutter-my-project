import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/quiz/repository/quiz_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizError extends ConsumerWidget {
  const QuizError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
