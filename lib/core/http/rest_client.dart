import 'package:dio/dio.dart';

import 'rest_helper.dart';

abstract class RestClient {
  Future<RestHelper> getClient();
}
