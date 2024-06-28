class TagDto {
  final String? name;
  final List<String>? quizes;

  TagDto({
    required this.name,
    required this.quizes,
  });

  factory TagDto.fromJson(Map<String, dynamic> json) => TagDto(
      name: json['name'] as String?,
      quizes: (json['quizes'] as List<dynamic>?)?.cast<String>(),);
}
