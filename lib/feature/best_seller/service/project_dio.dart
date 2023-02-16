import 'package:dio/dio.dart';

class ProjectDioMixin {
  final servise =
      Dio(BaseOptions(baseUrl: "https://assign-api.piton.com.tr/api/rest/"));
}
