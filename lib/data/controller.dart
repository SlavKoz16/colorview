import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MyApiClass {
  final titleController = TextEditingController();
  final urlController = TextEditingController();
  final dataController = TextEditingController();

  void sendDataToServer() async {
    final String title = titleController.text;
    final String url = urlController.text;
    final String data = dataController.text;


    const String apiUrl = 'http://localhost:2314';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'title': title,
          'url': url,
          'description': data,
        }),
      );
      if (response.statusCode == 200) {

        print('Данные успешно отправлены: ${response.body}');
      } else {

        print('Ошибка при отправке данных: ${response.statusCode}');
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }
}
