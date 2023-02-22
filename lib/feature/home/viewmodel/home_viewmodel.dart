import 'dart:io';
import 'package:flutter/material.dart';

import '../../best_seller/model/model_best_seller.dart';
import '../model/model_category.dart';
import '../service/get_categories_service.dart';
import '../../../product/service/project_dio.dart';
import '../view/homeview.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;

  List<CategoryModel> resourceCategory = [];
  List<List<BestSellerModel>> resourceProductHome = [];
  //List<BestSellerModel> resourceProductImageHVM = [];

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
    // getList();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    changeLoading();
    resourceCategory = await categoryService.getCategories() ?? [];
    await Future.forEach(resourceCategory,
        (element) async => await getListProduct(element.id ?? 0));

    changeLoading();
  }

  Future<void> getListProduct(int id) async {
    List<BestSellerModel> list = await categoryService.getProduct(id) ?? [];
    await getListProduct1(list);
    resourceProductHome.add(list);
  }

  Future<void> getListProduct1(List<BestSellerModel> model) async {
    await Future.forEach(model, (element) async {
      element.cover =
          await categoryService.getProductImage(cover: element.cover ?? "");
      model.firstWhere((element2) => element.id == element2.id).cover =
          element.cover;
    });
  }
}
