class PageDTO {
  String? id;
  String? question;
  Map<dynamic, dynamic>? answers;
  String? image;

  PageDTO({this.id, this.question, this.image, this.answers});

  PageDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String? ?? '';
    question = json['question'] as String? ?? '';
    image = json['image'] as String? ?? '';
    answers = (json['answers'] as Map<dynamic, dynamic>? ?? '') as Map?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['image'] = image;
    data['answers'] = answers;
    return data;
  }
}
