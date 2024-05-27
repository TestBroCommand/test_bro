// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:test_bro/src/feature/home/model/entities/final_page_entitiy.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_page_entity.dart';
import 'package:test_bro/src/feature/home/model/entities/start_page_entitiy.dart';

class Quiz extends Equatable {
  final String title;
  final int takers;
  final List<QuizPage> pages;
  final Image image;
  final StartQuizPage startPage;
  final FinalQuizPage finalPage;
  const Quiz({
    required this.title,
    required this.takers,
    required this.pages,
    required this.image,
    required this.startPage,
    required this.finalPage,
  });

  @override
  List<Object?> get props => [
        title,
        takers,
        pages,
        startPage,
        finalPage,
      ];

  Quiz copyWith({
    String? title,
    int? takers,
    List<QuizPage>? pages,
    Image? image,
    StartQuizPage? startPage,
    FinalQuizPage? finalPage,
  }) => Quiz(
      title: title ?? this.title,
      takers: takers ?? this.takers,
      pages: pages ?? this.pages,
      image: image ?? this.image,
      startPage: startPage ?? this.startPage,
      finalPage: finalPage ?? this.finalPage,
    );
}
