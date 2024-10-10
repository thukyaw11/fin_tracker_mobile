class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<Category> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }
}
