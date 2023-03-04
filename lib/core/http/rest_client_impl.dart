import 'package:dio/dio.dart';

import '../../config/flavor_config.dart';
import '../../di/injection_container.dart';
import '../preference/pref_helper.dart';
import 'api_constants.dart';
import 'rest_client.dart';
import 'rest_helper.dart';

class RestClientImpl implements RestClient {
  RestClientImpl({required this.dioClient});

  final Dio dioClient;

  @override
  Future<RestHelper> getClient() async {
    dioClient.options.baseUrl = FlavorConfig.instance!.baseUrl;
    PrefHelper helper = sl();

    Map<String, dynamic> headersMap = {
      'Content-Type': 'application/json',
    };

    String token = "";
    headersMap.putIfAbsent('Token', () => token);

    dioClient.options.headers = headersMap;

    dioClient.options.connectTimeout = API_CONNECT_TIMEOUT;
    dioClient.options.receiveTimeout = RECEIVE_TIMEOUT;
    return RestHelper(dioClient);
  }

  Future<void> attachCertificate(
      {required bool isInfinite,
      bool isContentPages = false,
      bool isMultipart = false,
      Map<String, dynamic>? extraHeaders}) async {
    // Settings SSL Pinning Certificate
    // SecurityContext clientContext = SecurityContext(withTrustedRoots: false);
    // var certificate = (await rootBundle.load(FlavorConfig.instance!.cert_path))
    //     .buffer
    //     .asInt8List();
    // clientContext.setTrustedCertificatesBytes(certificate);
    // (dioClient.httpClientAdapter as DefaultHttpClientAdapter)
    //         .onHttpClientCreate =
    //     (HttpClient client) => HttpClient(context: clientContext);
  }

  @override
  Dio? getDioClientOnly(Map<String, String> headers) {
    dioClient.options.headers = headers;
    dioClient.options.baseUrl = FlavorConfig.instance!.baseUrl;
    return dioClient;
  }

  @override
  Future<RestHelper> getClientWithoutHeaders() async {
    dioClient.options.baseUrl = FlavorConfig.instance!.baseUrl;
    return RestHelper(dioClient);
  }
}
