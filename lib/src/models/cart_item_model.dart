// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:greengrocer/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;
  String id;

  CartItemModel({
    required this.item,
    required this.id,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': item.toMap(),
      'quantity': quantity,
      'id': id,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      item: ItemModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartItemModel(item: $item, quantity: $quantity, id: $id)';
}
