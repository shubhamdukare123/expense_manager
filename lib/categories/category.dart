// lib/models/category.dart
import 'dart:convert';

class Category {
  int id;
  String name;
  String description;
  String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description, imageUrl: $imageUrl}';
  }
}

List<Category> parseCategories(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}
