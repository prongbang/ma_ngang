class Category {
  final String name;
  final String cover;
  final String json;

  Category({this.name, this.cover, this.json});

  Category.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        cover = map['cover'],
        json = map['json'];
}
