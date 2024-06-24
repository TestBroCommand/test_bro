// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/home/model/DTO/quiz_DTO.dart';

class QuizEntity extends Equatable {
  final String id;
  final String title;
  final int takers;
  final List<String> pages;
  final String image;
  final List<String> startPage;
  final List<String> finalPage;
  final bool isUquiz;

  const QuizEntity({
    required this.title,
    required this.takers,
    required this.pages,
    required this.image,
    required this.startPage,
    required this.finalPage,
    required this.id,
    required this.isUquiz,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        takers,
        pages,
        image,
        startPage,
        finalPage,
        isUquiz,
      ];

  QuizEntity copyWith({
    String? id,
    String? title,
    int? takers,
    List<String>? pages,
    String? image,
    List<String>? startPage,
    List<String>? finalPage,
    bool? isUquiz,
  }) =>
      QuizEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        takers: takers ?? this.takers,
        pages: pages ?? this.pages,
        image: image ?? this.image,
        startPage: startPage ?? this.startPage,
        finalPage: finalPage ?? this.finalPage,
        isUquiz: isUquiz ?? this.isUquiz,
      );

  factory QuizEntity.fromDto(QuizDTO dto, {bool isUquiz = false}) => QuizEntity(
        id: dto.id ?? '',
        title: dto.name ?? '',
        takers: dto.complete ?? 0,
        pages: dto.pages ?? [],
        image: dto.image ?? '',
        startPage: dto.startPage != null ? [dto.startPage!] : [],
        finalPage: dto.finalPage ?? [],
        isUquiz: isUquiz,
      );
}
