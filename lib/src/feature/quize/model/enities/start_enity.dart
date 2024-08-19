import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/quize/model/DTO/start_DTO.dart';

class StartEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  final String description;

  const StartEntity({
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

  StartEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
  }) =>
      StartEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory StartEntity.fromDto(StartDTO dto) => StartEntity(
        id: dto.id ?? 'r',
        image: dto.image ?? '',
        name: dto.name ?? '',
        description: dto.description ?? '',
      );
}
