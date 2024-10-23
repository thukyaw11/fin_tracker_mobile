class Category {
  final String id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});

  @override
  String toString() {
    return 'Category{id: $id, name: $name, icon: $icon}';
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name'], icon: json['icon']);
  }

  static List<Category> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }
}
