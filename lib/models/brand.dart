import 'package:flutter/material.dart';

class Brand {
  final String name;
  final String filename;

  Brand({
    required this.name,
    required this.filename,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        filename = json['filename'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'filename': filename,
      };

  @override
  String toString() {
    return '$name, $filename';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Brand && other.name == name && other.filename == filename;
  }

  @override
  int get hashCode => hashValues(filename, name);
}
