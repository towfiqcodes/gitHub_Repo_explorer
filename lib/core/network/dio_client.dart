import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(BaseOptions(baseUrl: 'https://api.github.com')) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("Request: \${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("Response: \${response.statusCode}");
        return handler.next(response);
      },
      onError: (e, handler) {
        print("Error: \${e.message}");
        return handler.next(e);
      },
    ));
  }
}
