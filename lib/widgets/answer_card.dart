import 'package:flutter/material.dart';

import 'circular_icon.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayAnswer,
    required this.onTap,
  });

  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayAnswer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(offset: Offset(2, -2)),
          ],
          border: Border.all(
            color: isDisplayAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                answer,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: isDisplayAnswer && isCorrect ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isDisplayAnswer)
              isCorrect
                  ? const CircularIcon(
                      icon: Icons.check,
                      color: Colors.green,
                    )
                  : isSelected
                      ? const CircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                        )
                      : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
