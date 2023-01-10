import 'dart:convert';

import 'package:greengrocer/src/models/item_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String title;
  String id;
  List<ItemModel> items = [];
  int pagination;

  CategoryModel({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'items': items,
      'pagination': pagination,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      id: map['id'] as String,
      // aqui o pulo para não usar a biblioteca de classes
      items: (map['items'] as List<dynamic>?)
              ?.map((e) => ItemModel.fromMap(e))
              .toList() ??
          [],
      pagination: map['pagination'] as int? ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id, items: $items, pagination: $pagination)';
  }
}
