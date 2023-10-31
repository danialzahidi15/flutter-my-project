import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_danthocode/enums/difficulty.dart';
import 'package:flutter_danthocode/models/question/question_model.dart';
import 'package:flutter_danthocode/repositories/quiz/base_quiz_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import '../../models/question/failure_model.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final quizRepositoryProvider = Provider<QuizRepository>(
  (ref) => QuizRepository(ref.read),
);

class QuizRepository extends BaseQuizRepositories {
  final Reader _reader;

  QuizRepository(this._reader);

  @override
  Future<List<Question>> getQuestions({
    @required int? numQuestions,
    @required int? categoryId,
    @required Difficulty? difficulty,
  }) async {
    try {
      final queryParameters = {
        'type': 'multiple',
        'amount': numQuestions,
        'category': categoryId,
      };

      if (difficulty != Difficulty.any) {
        queryParameters.addAll({
          'difficulty': EnumToString.convertToString(difficulty),
        });
      }

      final response = await _reader(dioProvider).get(
        'https://opentdb.com/api.php',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String, dynamic>>.from(data['results'] ?? []);
        if (results.isNotEmpty) {
          return results.map((e) => Question.fromMap(e)).toList();
        }
      }

      return [];
    } on DioError catch (e) {
      print(e);
      throw Failure(message: e.response!.statusMessage!);
    } on SocketException catch (e) {
      print(e);
      throw const Failure(message: 'Please check your connection');
    }
  }
}
