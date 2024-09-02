import 'package:dio/dio.dart';
import 'package:system_package/src/network/client/client_dio.dart';

class SystemNetworkDio {
  final ClientDio _clientDio = ClientDio();
  ClientDio get clientDio => _clientDio;

  SystemNetworkDio();

  Future<Response> delete(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await _clientDio.client.delete(url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> get(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await _clientDio.client.get(url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> post(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await _clientDio.client.post(url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> put(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await _clientDio.client.put(url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }
}
