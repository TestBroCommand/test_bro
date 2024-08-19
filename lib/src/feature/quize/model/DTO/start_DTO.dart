class StartDTO {
  String? id;
  String? name;
  String? image;
  String? description;

  StartDTO({this.id, this.name, this.image, this.description});

  StartDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
