class QuizDTO{
  final String? id;
  final String? name;
  final String? image;
  final int? complete;
  final List<String>? pages;
  final String? startPage;
  final List<String>? finalPage;

  QuizDTO({
    this.id,
    this.name,
    this.image,
    this.complete,
    this.pages,
    this.startPage,
    this.finalPage,
  });

  factory QuizDTO.fromJson(Map<String, dynamic> json) {
    return QuizDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      complete: json['complete'] as int?,
      pages: (json['pages'] as List<dynamic>?)?.cast<String>(),
      startPage: json['start_page'] as String?,
      finalPage: (json['final_page'] as List<dynamic>?)?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'complete': complete,
      'pages': pages,
      'start_page': startPage,
      'final_page': finalPage,
    };
  }
}
