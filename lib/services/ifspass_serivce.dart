import 'package:system_package/system.dart';

class IfspassService {
  static Future<(String?, SystemUser?)> login({
    required String username,
    required String password,
  }) async {
    final response = await IfspassApi().login(
      username: username,
      password: password,
    );

    String token = response.data['token'];
    SystemUser user = SystemUser.fromJson(
      response.data['user'],
    );

    IfspassApi().addInterceptor(
      TokenInterceptor(token: token),
    );

    await SecureLocalData.saveData(
      key: SecureDataKey.token,
      value: token,
    );

    return (token, user);
  }
}
