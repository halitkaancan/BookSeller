import 'dart:io';
import 'package:flutter/material.dart';

import '../../best_seller/model/model_best_seller.dart';
import '../model/model_category.dart';
import '../service/get_categories_service.dart';
import '../../../product/service/project_dio.dart';
import '../view/homeview.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;
  late final ICategoryService productService;

  List<CategoryModel> resourceCategory = [];
  List<BestSellerModel> resourceProduct = [];
  List<BestSellerModel> resourceProductImageHVM = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    categoryService = CategoryService(service);
    productService = CategoryService(service);
    // getList();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    resourceCategory = await categoryService.getCategories() ?? [];
  }

  Future<void> getListProduct() async {
    resourceProduct = await productService.getProduct() ?? [];
  }
}
