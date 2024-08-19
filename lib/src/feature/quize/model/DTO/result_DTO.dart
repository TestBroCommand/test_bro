class FinalDTO {
  String? id;
  String? image;
  String? name;
  String? description;
  int? mostFrequentDigit;

  FinalDTO({
    this.id,
    this.image,
    this.name,
    this.description,
    this.mostFrequentDigit,
  });

  FinalDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    mostFrequentDigit = int.parse(json['digit'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['most_frequent_digit'] = mostFrequentDigit;
    return data;
  }
}
