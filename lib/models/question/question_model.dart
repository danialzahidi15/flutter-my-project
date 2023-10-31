// ignore_for_file: public_member_api_docs, sort_constructors_first
// https://opentdb.com/api.php?amount=10

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String category;
  final String dificulty;
  final String question;
  final String correctAnswer;
  final List<String> answers;

  const Question({
    required this.category,
    required this.dificulty,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  @override
  List<Object> get props {
    return [
      category,
      dificulty,
      question,
      correctAnswer,
      answers,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'dificulty': dificulty,
      'question': question,
      'correctAnswer': correctAnswer,
      'answers': answers,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      category: map['category'] ?? '',
      dificulty: map['dificulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correctAnswer'] ?? '',
      answers: List<String>.from((map['incorrect_answer'] ?? []))
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
