import 'package:dio/dio.dart';
import 'package:system_package/src/network/api/system_api.dart';

class IfspassApi extends SystemApi {
  IfspassApi();

  Future<Response> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = networkDio.post(
        url: '/v1/user/login',
        body: {
          'username': username,
          'password': password,
        },
      );

      return response;
    } catch (error) {
      throw error;
    }
  }
}
