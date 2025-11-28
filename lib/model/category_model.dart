class CategoryModel {
  final String name;
  final String url;
  final String slug;

  CategoryModel({required this.name, required this.url, required this.slug});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(name: map['name'], url: map['url'], slug: map['slug']);
  }
}
