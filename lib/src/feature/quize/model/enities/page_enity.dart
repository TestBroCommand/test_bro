import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/quize/model/DTO/page_DTO.dart';

class PageEntity extends Equatable {
  final String id;
  final String question;
  final String image;
  final Map<dynamic, dynamic> answers;

  const PageEntity({
    required this.id,
    required this.question,
    required this.image,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        image,
        answers,
      ];

  PageEntity copyWith({
    String? id,
    String? question,
    String? image,
    Map<dynamic, dynamic>? answers,
  }) =>
      PageEntity(
        id: id ?? this.id,
        question: question ?? this.question,
        image: image ?? this.image,
        answers: answers ?? this.answers,
      );

  factory PageEntity.fromDto(PageDTO dto) => PageEntity(
        id: dto.id ?? "",
        question: dto.question ?? '',
        image: dto.image ?? '',
        answers: processEntities(dto.answers ?? {}),
      );

  static Map<dynamic, dynamic> processEntities(Map<dynamic, dynamic> entities) {
    final Map<dynamic, dynamic> processedAnswers = {};
    int counter = 0;

    entities.forEach((key, value) {
      if (value is Map) {
        value.forEach((innerKey, innerValue) {
          processedAnswers[counter] = innerKey.toString();
          counter++;
        });
      } else {
        processedAnswers[counter] = value.toString();
        counter++;
      }
    });

    return processedAnswers;
  }
}
