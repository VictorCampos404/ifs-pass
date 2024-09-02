import 'package:dio/dio.dart';
import 'package:system_package/src/network/services/system_network_dio.dart';

abstract class SystemApi {
  static late SystemNetworkDio _networkDio;

  SystemNetworkDio get networkDio => _networkDio;

  void initClient() {
    _networkDio = SystemNetworkDio();
  }

  void addInterceptor(Interceptor element) {
    _networkDio.clientDio.client.interceptors.add(element);
  }

  void removeInterceptor<T>() {
    _networkDio.clientDio.client.interceptors.removeWhere(
      (element) => element is T,
    );
  }

  bool isError(DioException dioException, String error) {
    return dioException.response?.data['error']?.toString().contains(error) ??
        false;
  }
}
