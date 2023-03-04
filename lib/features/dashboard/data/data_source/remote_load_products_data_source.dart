
import '../../../../core/models/api_response.dart';

abstract class RemoteLoadProductsDataSource {
  Future<dynamic> loadProducts();
}
