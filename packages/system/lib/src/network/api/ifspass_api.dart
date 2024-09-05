import 'package:dio/dio.dart';
import 'package:system_package/src/network/api/system_api.dart';
import 'package:system_package/src/network/exceptions/system_exeception.dart';

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
    } on DioException catch (error) {
      if (isError(error, "USERNAME_OR_PASSWORD_WRONG")) {
        throw InvalidPasswordDioExcepition();
      }

      if (isError(error, "FIRST_ACCESS")) {
        throw FirstAccessDioExcepition(
          moodleToken: error.response?.data['moodleToken'],
        );
      }

      throw UnknownDioExcepition();
    } catch (error) {
      throw UnknownDioExcepition();
    }
  }
}
