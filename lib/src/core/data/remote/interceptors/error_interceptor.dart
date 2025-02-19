import 'package:dio/dio.dart';
import '../base/api_error.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  bool isRefreshing = false;
  bool isShowingExpireTokenDialog = false;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map<String, dynamic>) {
      final error = response.data['error'];
      if (error != null) {
        throw ApiError.server(
          code: error['code'],
          message: error['message'],
        );
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
     //log out
    } else {
      handler.next(err);
    }
  }
}
