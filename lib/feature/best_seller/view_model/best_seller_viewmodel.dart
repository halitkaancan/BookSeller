import 'package:flutter/material.dart';

import '../../../product/service/project_dio.dart';
import '../../home/service/get_categories_service.dart';
import '../model/model_best_seller.dart';
import '../view/best_seller.dart';

abstract class BestSellerViewModel extends State<BestSellerPage>
    with ProjectDioMixin {
  late final ICategoryService productService;

  List<BestSellerModel> resourceProduct = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    productService = CategoryService(service);

    // TODO: implement initState
    super.initState();
  }

  Future<List<BestSellerModel>> getListProduct() async {
    resourceProduct = await productService.getProduct(1) ?? [];

    await Future.forEach(resourceProduct, (element) async {
      element.cover =
          await productService.getProductImage(cover: element.cover ?? "");
      resourceProduct
          .firstWhere((element2) => element.id == element2.id)
          .cover = element.cover;
    });
    return resourceProduct;
  }

  Future<void> newMethod() async {
    resourceProduct = await productService.getProduct(1) ?? [];
  }
}
