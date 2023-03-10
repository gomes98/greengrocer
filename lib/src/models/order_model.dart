// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime? createdOrderTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;
  String qrcodeImage;

  bool get isOverDue => overdueDateTime.isBefore(DateTime.now());

  OrderModel({
    required this.id,
    this.createdOrderTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
    required this.qrcodeImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdOrderTime?.millisecondsSinceEpoch,
      'due': overdueDateTime.millisecondsSinceEpoch,
      'items': items.map((x) => x.toMap()).toList(),
      'status': status,
      'copiaecola': copyAndPaste,
      'total': total,
      'qrcodeImage': qrcodeImage,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      createdOrderTime:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      overdueDateTime: DateTime.parse(map['due']),
      items: map['items'] != null
          ? List<CartItemModel>.from(
              (map['items'] as List<int>).map<CartItemModel>(
                (x) => CartItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      status: map['status'] as String,
      copyAndPaste: map['copiaecola'] as String,
      total: map['total'] as double,
      qrcodeImage: map['qrCodeImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdOrderTime: $createdOrderTime, overdueDateTime: $overdueDateTime, items: $items, status: $status, copyAndPaste: $copyAndPaste, total: $total, qrcodeImage: $qrcodeImage)';
  }
}
