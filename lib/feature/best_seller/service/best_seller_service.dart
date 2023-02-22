import 'package:dio/dio.dart';
import '../../home/model/model_category.dart';

// abstract class IBestSellerService {
//   IBestSellerService(this.dio);
//   final Dio dio;

//   Future<List<BestSellerModel>> getProduct();
// }

// class ProductService extends IBestSellerService {
//   ProductService(Dio dio) : super(dio);

//   @override
//   Future<List<BestSellerModel>> getProduct() async {
//     final response = await dio.get('/'); // burası doldurulacak
//     if (response.statusCode == 200) {
//       final jsonBody = response.data["product"];
//       if (jsonBody is List) {
//         return jsonBody.map((json) => BestSellerModel.fromJson(json)).toList();
//       }
//     }
//     return [];
//   }
// }
