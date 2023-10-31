import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_controller.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_state.dart';
import 'package:flutter_danthocode/enums/difficulty.dart';
import 'package:flutter_danthocode/models/question/failure_model.dart';
import 'package:flutter_danthocode/repositories/quiz/quiz_repositories.dart';
import 'package:flutter_danthocode/widgets/common_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/question/question_model.dart';
import '../../widgets/quiz_questions.dart';
import '../../widgets/quiz_results.dart';
import 'quiz_error.dart';

final quizQuestionProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestions: 5,
        categoryId: Random().nextInt(24) + 9,
        difficulty: Difficulty.any,
      ),
);

class QuizScreen extends HookConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final quizQuestion = ref.watch(quizQuestionProvider);
    final pageController = usePageController();
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: quizQuestion.when(
          data: (ques) => _quizBody(context, pageController, ques, ref),
          error: (error, _) => QuizError(
            message: error is Failure ? error.message : 'Something went wrong!',
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        bottomSheet: quizQuestion.maybeWhen(
          data: (question) {
            final quizState = ref.watch(quizControllerProvider);
            if (!quizState.answered) return const SizedBox.shrink();
            return CommonButton(
              title: pageController.page!.toInt() + 1 < question.length ? 'Next Question' : 'See Results',
              onTap: () {
                ref.read(quizControllerProvider.notifier).nextQuestion(question, pageController.page!.toInt());
                if (pageController.page!.toInt() + 1 < question.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  _quizBody(
    BuildContext context,
    PageController pageController,
    List<Question> questions,
    WidgetRef ref,
  ) {
    if (questions.isEmpty) return const QuizError(message: 'No question found!');

    final quizState = ref.watch(quizControllerProvider);
    return quizState.status == QuizStatus.complete
        ? QuizResults(
            state: quizState,
            questions: questions,
          )
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }
}
