import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/feature/book_details/view/book_details.dart';
import 'package:mobileapp/product/service/project_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookDetailsViewModel extends State<BookDetailsView>
    with ProjectDioMixin {
  @override
  Map<String, dynamic> getJsonFromJWT(String splittedToken) {
    String normalizedSource = base64Url.normalize(splittedToken);
    return jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));
  }

  bool isPressed = false;

  void _onButtonPressed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('buttonClicked', true);
  }

  bool isButtonClicked = false;

  void _loadButtonClickedStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('buttonClicked') ?? false;
    setState(() {
      isButtonClicked = value;
    });
  }

  String getUserId() {
    final Map<String, dynamic> decodedToken =
        getJsonFromJWT(widget.token.split(".")[1]);

    final String userId =
        decodedToken["https://hasura.io/jwt/claims"]["x-hasura-user-id"];

    print(userId);

    return userId;
  }

  Future<void> like({required int productId}) async {
    await service.post("/like",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }

  Future<void> unlike({required int productId}) async {
    service.post("/unlike",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }
}
