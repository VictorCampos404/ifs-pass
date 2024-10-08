import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final String token;

  TokenInterceptor({required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
      {
        'token': token,
      },
    );
    super.onRequest(options, handler);
  }
}
