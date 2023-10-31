import 'package:flutter/material.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_controller.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_state.dart';
import 'package:flutter_danthocode/repositories/quiz/quiz_repositories.dart';
import 'package:flutter_danthocode/widgets/common_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question/question_model.dart';

class QuizResults extends ConsumerWidget {
  const QuizResults({
    super.key,
    required this.state,
    required this.questions,
  });

  final QuizState state;
  final List<Question> questions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Correct',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        CommonButton(
          title: 'New Quiz',
          onTap: () {
            ref.refresh(quizRepositoryProvider);
            ref.read(quizControllerProvider.notifier).reset();
          },
        ),
      ],
    );
  }
}
