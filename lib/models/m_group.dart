class Group {
  final String id;
  final String name;

  Group({required this.id, required this.name});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<Group> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Group.fromJson(json)).toList();
  }
}
