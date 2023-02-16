import 'dart:io';

import 'package:dio/dio.dart';

class CategoryService {
  static const baseUrl = 'https://assign-api.piton.com.tr/api/rest';

  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<dynamic> getCategories() async {
    try {
      final response = await dio.get('/categories');
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }
}
