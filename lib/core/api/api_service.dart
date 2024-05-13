import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  final _baseUrl = "https://fcm.googleapis.com/fcm/send";

  ApiService(this._dio);

  Future<Map<String, dynamic>> post(
      {required Map<String, dynamic> data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    var response = await _dio.post(_baseUrl,
        data: data,
        options: Options(headers: headers),
        queryParameters: queryParameters);
    return response.data;
  }
}
