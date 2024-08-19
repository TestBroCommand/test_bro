import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/quize/model/DTO/page_DTO.dart';

class PageEntity extends Equatable {
  final String id;
  final String question;
  final String image;
  final Map<int, Map<String, int>> answers;

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
    Map<int, Map<String, int>>? answers,
  }) =>
      PageEntity(
        id: id ?? this.id,
        question: question ?? this.question,
        image: image ?? this.image,
        answers: answers ?? this.answers,
      );

  factory PageEntity.fromDto(PageDTO dto) => PageEntity(
        id: dto.id ?? '',
        question: dto.question ?? '',
        image: dto.image ?? '',
        answers: processEntities(dto.answers!),
      );

  static Map<int, Map<String, int>> processEntities(
    Map<dynamic, dynamic> entities,
  ) {
    final newMap = <int, Map<String, int>>{};

    entities.forEach((key, value) {
      final intKey = int.parse(key.toString()); // convert key to int
      final innerMap = <String, int>{
        for (final innerEntry in (value as Map).entries)
          innerEntry.key as String: int.parse(innerEntry.value.toString()),
      }; // convert value to Map<String, int>
      newMap[intKey] = innerMap;
    });
    return newMap;
  }
  /* 
  static Map<int, Map<String, int>> processEntities(
      Map<dynamic, dynamic> entities) {
    final Map<int, Map<String, int>> processedAnswers = {};
    int counter = 0;

    entities.forEach((key, value) {
      if (value is Map) {
        final innerMap = <String, int>{};
        value.forEach((innerKey, innerValue) {
          innerMap[innerKey.toString()] = innerValue[key];
        });
        processedAnswers[counter] = innerMap;
        counter++;
      } else {
        final innerMap = <String, int>{};
        innerMap[key.toString()] = value as int;
        processedAnswers[counter] = innerMap;
        counter++;
      }
    });

    return processedAnswers;
  }
  */
}
