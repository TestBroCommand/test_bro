// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StartQuizPage extends Equatable {
  final String title;
  final Image image;
  final String description;
  const StartQuizPage({
    required this.title,
    required this.image,
    required this.description,
  });

  StartQuizPage copyWith({
    String? title,
    Image? image,
    String? description,
  }) =>
      StartQuizPage(
        title: title ?? this.title,
        image: image ?? this.image,
        description: description ?? this.description,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        image,
      ];
}
