import 'package:dio/dio.dart';
import '../../best_seller/model/model_best_seller.dart';
import '../model/model_category.dart';

abstract class ICategoryService {
  ICategoryService(this.dio);
  final Dio dio;

  Future<List<CategoryModel>?> getProduct();
}

class CategoryService extends ICategoryService {
  CategoryService(Dio dio) : super(dio);

  Future<List<BestSellerModel>?> getCategories() async {
    final response = await dio.get('/categories');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => BestSellerModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<CategoryModel>?> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
