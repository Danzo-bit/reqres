

import 'package:dio/dio.dart';


class BaseService{

final Dio _dio = Dio(
   BaseOptions(
     baseUrl: 'https://reqres.in',
     validateStatus:
         (status) {
       return status! < 500;
     },
     headers:
     {
       "Accept": "*/*",
       "Content-Type": "application/json",
       "Connection": "keep-alive",
     },
     connectTimeout: const Duration(seconds: 60 * 1000),
     receiveTimeout: const Duration(seconds: 60 * 1000),
   )
 )..interceptors.add(LogInterceptor());


Future<Response> request(String url, {dynamic body, required String method}) async {
    
   var res = _dio.request(url,
       data: body,
       options: Options(
           method: method,
       ));
   return res;
 }


}

class Source{
  BaseService service = BaseService();

  Future getUsers()async{
    var result = await service.request("/api/users?page=2", method: 'GET');
    return result;
  }
}

