import 'dart:io';
import 'package:dio/dio.dart';

import '../../../product/model/category_model.dart';

// abstract class ICategoryService {
//   ICategoryService(this.dio);
//   final Dio dio;

//   Future<List<CategoryModel>?> getSourceItem;
// }

// class getService extends ICategoryService {
//   getService(Dio dio) : super(dio);
//  Future<List<CategoryModel>?> getSourceItem()async{

//  }

// }

abstract class ICategoryService {
  ICategoryService(this.dio);
  final Dio dio;

  Future<List<GetCategoriesModel>?> getCategories();
}

class CategoryService extends ICategoryService {
  CategoryService(Dio dio) : super(dio);

  @override
  Future<List<GetCategoriesModel>?> getCategories() async {
    final response = await dio.get('/categories');
    if (response.statusCode == 200) {
      final jsonBody = response.data["category"];
      if (jsonBody is List) {
        return jsonBody
            .map((json) => GetCategoriesModel.fromJson(json))
            .toList();
      }
    }
    return null;
  }
}
