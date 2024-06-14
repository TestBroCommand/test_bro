// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:test_bro/src/feature/quize/model/DTO/result_DTO.dart';

class FinalEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  final String description;
  final int mostFrequentDigit;

  const FinalEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.mostFrequentDigit,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        description,
      ];

  factory FinalEntity.fromDto(FinalDTO dto) => FinalEntity(
        id: dto.id ?? "",
        image: dto.image ?? '',
        name: dto.name ?? '',
        description: dto.description ?? '',
        mostFrequentDigit: dto.mostFrequentDigit ?? 0,
      );

  FinalEntity copyWith({
    String? id,
    String? image,
    String? name,
    String? description,
    int? mostFrequentDigit,
  }) => FinalEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      mostFrequentDigit: mostFrequentDigit ?? this.mostFrequentDigit,
    );
}
