import 'package:flutter/material.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_controller.dart';
import 'package:flutter_danthocode/controller/quiz/quiz_state.dart';
import 'package:flutter_danthocode/models/question/question_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'answer_card.dart';


class QuizQuestions extends ConsumerWidget {
  const QuizQuestions({
    super.key,
    required this.pageController,
    required this.state,
    required this.questions,
  });

  final PageController pageController;
  final QuizState state;
  final List<Question> questions;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          children: [
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                // HtmlCharacterEntities.decode(question.question),
                question.question,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 32,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Column(
              children: question.answers.map((e) {
                return AnswerCard(
                  answer: e,
                  isSelected: e == state.selectedAnswer,
                  isCorrect: e == question.correctAnswer,
                  isDisplayAnswer: state.answered,
                  onTap: () {
                    ref.read(quizControllerProvider.notifier).submitAnswer(
                          question,
                          e,
                        );
                    print('hello nazurah');
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
