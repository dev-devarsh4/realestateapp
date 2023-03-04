import 'package:dartz/dartz.dart';
import 'package:realestateapp/core/models/api_response.dart';
import 'package:realestateapp/core/models/failure.dart';
import 'package:realestateapp/core/models/success.dart';
import 'package:realestateapp/features/dashboard/data/models/product.dart';
import 'package:realestateapp/features/dashboard/domain/dashboard_repo.dart';

import '../../../../core/http/network_info.dart';
import '../../../../di/injection_container.dart';
import '../data_source/remote_load_products_data_source.dart';

class DashboardRepoImpl extends DashboardRepo {
  RemoteLoadProductsDataSource remoteLoadProductsDataSource = sl();

  DashboardRepoImpl(NetworkInfo networkInfo) : super(networkInfo);

  @override
  Future<Either<Failure, Success>> loadProducts() async {
    dynamic apiResponse = await remoteLoadProductsDataSource.loadProducts();
    List<Product> products = (apiResponse as List).map((e) => Product.fromJson(e)).toList();
    return Right(Success(products));
  }
}
