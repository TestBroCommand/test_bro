import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/quize/model/DTO/result_DTO.dart';

class FinalEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  final String description;

  const FinalEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        description,
      ];

  FinalEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
  }) =>
      FinalEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory FinalEntity.fromDto(FinalDTO dto) => FinalEntity(
        id: dto.id ?? "",
        image: dto.image ?? '',
        name: dto.name ?? '',
        description: dto.description ?? '',
      );
}
