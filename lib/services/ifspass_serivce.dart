import 'package:system_package/system.dart';

class IfspassService {
  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await IfspassApi().login(
        username: username,
        password: password,
      );
      // IfspassApi().addInterceptor(
      //     TokenInterceptor(tokenParams: {'token': response.data['token']}));
      return response.data;
    } catch (_) {
      rethrow;
    }
  }
}
