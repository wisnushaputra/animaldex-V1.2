import 'package:flutter/material.dart';

class Animal {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final Color color;

  Animal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.color
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
      description: json['description'] ?? '',
      // Mengubah string hex (#FFFFFF) menjadi objek Color
      color: Color(int.parse(json['color_hex'].replaceFirst('#', '0xff'))),
    );
  }

}