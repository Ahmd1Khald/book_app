import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}

/*
class DioHelper {

  static const _baseUrl = 'https://www.googleapis.com/books/v1/';
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required endpoint,
    Map<String, dynamic>? query,
    String language = 'en',
    String? token,
  }) async {
    *//*dio.options.headers = {
      'lang': language,
      'Authorization': token,
      'Content-Type': 'application/json',
    };*//*

    return await dio.get(endpoint, queryParameters: query);
  }

  static Future<Response> postData({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String language = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': language,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String language = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': language,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio.put(url, queryParameters: query, data: data);
  }
}*/
