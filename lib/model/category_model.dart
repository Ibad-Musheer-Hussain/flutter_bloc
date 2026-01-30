class CategoryModel {
  final int id;
  final String title;
  final String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, image: $image)';
  }

  CategoryModel copyWith({
    int? id,
    String? title,
    String? image,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }
}
