import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  final storage = const FlutterSecureStorage();

  // salva dados na memoria do app
  Future<void> saveLocalData({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }

  // retorna os dados da memoria do app
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  // remove os dados da memoria do app
  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime.toLocal());
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14,
    );
  }

  Uint8List decodeQRCodeImage(String image) {
    String base64String = image.split(',').last;

    return base64.decode(base64String);
  }
}
