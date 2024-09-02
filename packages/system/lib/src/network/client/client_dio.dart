import 'package:dio/dio.dart';
import 'package:system_package/src/network/consts/options.dart';

class ClientDio {
  late Dio _client;
  late BaseOptions _baseOptions;

  ClientDio({
    BaseOptions? baseOptions,
  }) {
    _baseOptions = baseOptions ??
        BaseOptions(
            baseUrl: BASEURL,
            connectTimeout: REQUEST_TIMEOUT,
            receiveTimeout: RECIVE_TIMEOUT,
            contentType: CONTENTTYPE);
    _client = Dio(_baseOptions);
  }

  BaseOptions get baseOptions => _baseOptions;

  Dio get client => _client;
}
