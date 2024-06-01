class FinalDTO {
  String? id;
  String? image;
  String? name;
  String? description;

  FinalDTO({this.id, this.image, this.name, this.description});

  FinalDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
