import 'package:dio/dio.dart';
import 'package:stacked_starter/stacked_starter.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    final String accessToken = await storage.read(key: 'accessToken');
    options.headers.addAll({"Authorization": accessToken});
    return options;
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }
}
