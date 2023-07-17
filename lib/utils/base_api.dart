import 'package:dio/dio.dart';

class BaseApi {

  String api_key = '';
  late final Dio dio;

  BaseApi() {
    var options = BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-api-key':'789ea676e8264c9887a9e7fdc2c96ace'
      },
    );

    dio = Dio(options);

  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.get(path, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic> body = const {}, Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.post(path, data: body, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> patch(String path, {Map<String, dynamic> body = const {}, Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.patch(path, data: body, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> put(String path, {Map<String, dynamic> body = const {}, Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.put(path, data: body, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> delete(String path, {Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.delete(path, queryParameters: query);
    return process(response);
  }

  Map<String, dynamic> process(Response<dynamic> response) {
    return Map<String, dynamic>.from(response.data);
  }

}
