import 'dart:async';

import 'package:dartz/dartz.dart';

import '../http/network_info.dart';
import '../models/failure.dart';
import '../models/success.dart';
import '../string_constants/message_constants.dart';

abstract class BaseApiRepo {
  final NetworkInfo? networkInfo;

  BaseApiRepo(this.networkInfo);

  Future<Either<Failure, Success>> baseApiMethod(
      Future<Either<Failure, Success>> Function() apiCall) async {
    bool isConnected = await networkInfo!.isConnected;
    if (!isConnected) {
      return internetConnectionException();
    }

    try {
      return await apiCall();
    } catch (e) {
      return internetConnectionException();
    }
  }

  Left<Failure, Success> internetConnectionException() {
    return Left(
      Failure(
        message: labelPleaseCheckInternetConnection,
        apiStatus: 404,
      ),
    );
  }
}
