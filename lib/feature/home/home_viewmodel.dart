import 'dart:io';
import 'package:flutter/material.dart';

import '../../product/model/category_model.dart';
import '../best_seller/model/category_model.dart';
import '../best_seller/service/get_categories_service.dart';
import '../best_seller/service/project_dio.dart';
import 'homeview.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;

  List<GetCategoryModel> resource = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    categoryService = CategoryService(service);
    getList();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    resource = await categoryService.getCategories() ?? [];
  }
}
