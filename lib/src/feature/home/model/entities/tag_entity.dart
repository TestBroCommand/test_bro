import 'package:equatable/equatable.dart';
import 'package:test_bro/src/feature/home/model/DTO/tag_dto.dart';

class TagEntity extends Equatable {
  final String? name;
  final List<String>? quizes;

  const TagEntity({
    required this.name,
    required this.quizes,
  });

  @override
  List<Object?> get props => [name, quizes];

  TagEntity copyWith({
    String? name,
    List<String>? quizes,
  }) =>
      TagEntity(name: name ?? this.name, quizes: quizes ?? this.quizes);

  factory TagEntity.fromDto(TagDto dto) => TagEntity(
        name: dto.name,
        quizes: dto.quizes,
      );
}
