// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QuizPage extends Equatable {
  final String question;
  final Image image;
  final Map<String, String> answers;

  const QuizPage({
    required this.question,
    required this.image,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        question,
        image,
        answers,
      ];

  QuizPage copyWith({
    String? question,
    Image? image,
    Map<String, String>? answers,
  }) {
    return QuizPage(
      question: question ?? this.question,
      image: image ?? this.image,
      answers: answers ?? this.answers,
    );
  }
}
