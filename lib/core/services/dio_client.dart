import 'package:dio/dio.dart';
import 'auth_service.dart';

class DioClient{
  final Dio _dio = Dio();

  DioClient(){
    _dio.options.baseUrl = 'https://erp.vnconference.com/api/method/';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (option, handler) async {
        final token =  await AuthService.instance.getToken();
        if(token != null){
          option.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(option);
      },
      onError: (DioException e, handler){
        return handler.next(e);
      }
    ));
  }

  Dio get dio => _dio;
}