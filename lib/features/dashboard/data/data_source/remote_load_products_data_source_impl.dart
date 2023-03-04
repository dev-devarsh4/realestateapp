import 'package:realestateapp/core/http/rest_helper.dart';
import 'package:realestateapp/features/dashboard/data/data_source/remote_load_products_data_source.dart';

import '../../../../core/http/rest_client.dart';
import '../../../../core/models/api_response.dart';

class RemoteLoadProductsDataSourceImpl extends RemoteLoadProductsDataSource {
  final RestClient? restClient;

  RemoteLoadProductsDataSourceImpl({required this.restClient});

  @override
  Future<dynamic> loadProducts() async {
    RestHelper restHelper = await restClient!.getClient();
    return restHelper.loadProducts();
  }
}
