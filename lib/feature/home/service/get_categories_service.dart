import 'package:dio/dio.dart';
import '../../best_seller/model/model_best_seller.dart';
import '../model/model_category.dart';

abstract class ICategoryService {
  ICategoryService(this.dio);
  final Dio dio;

  Future<List<CategoryModel>?> getCategories();

  Future<List<BestSellerModel>?> getProduct(int id);
  Future<String> getProductImage({required String cover});
}

class CategoryService extends ICategoryService {
  CategoryService(Dio dio) : super(dio);

  @override
  Future<List<CategoryModel>?> getCategories() async {
    final response = await dio.get('/categories');
    if (response.statusCode == 200) {
      final jsonBody = response.data["category"];
      if (jsonBody is List) {
        return jsonBody.map((json) => CategoryModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<BestSellerModel>> getProduct(int id) async {
    final response = await dio.get('/products/$id');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => BestSellerModel.fromJson(json)).toList();
      }
    }
    return [];
  }

  @override
  Future<String> getProductImage({required String cover}) async {
    try {
      final response =
          await dio.post('/cover_image', data: {'fileName': cover});
      if (response.statusCode == 200) {
        final jsonBody = response.data["action_product_image"]["url"];
        return jsonBody;
      }
      return "";
    } on DioError catch (e) {
      print(e.response);
      return "";
    }
  }
}
