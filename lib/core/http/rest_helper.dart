import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response.dart';
import 'api_constants.dart';

part 'rest_helper.g.dart';

//flutter pub run build_runner build
@RestApi(baseUrl: "")
abstract class RestHelper {
  factory RestHelper(Dio dio, {String? baseUrl}) = _RestHelper;

  @GET(USERS_API)
  Future<ApiResponse> fetchUsers();

  @GET(PRODUCTS_API)
  Future<dynamic> loadProducts();
}
