import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:insta_daleel/commons/network/api_exceptions.dart';
import 'package:insta_daleel/commons/network/interceptors/logger_interceptor.dart';
import 'package:insta_daleel/commons/network/interceptors/token_interceptor.dart';
import 'package:insta_daleel/data/datasources/user_in_memory_cache.dart';

const String _baseUrl = 'https://insta-daleel.emicon.tech/api';
// final String apiKey = dotenv.env['API_KEY']!;

@lazySingleton
class ApiClient with InMemoryUserCache {
  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            connectTimeout: 5000,
            receiveTimeout: 12000,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([LoggerInterceptor(), TokenInterceptor()]);

  late final Dio _dio;

  Future<Map<String, dynamic>> signIn(Map<String, dynamic> req) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {...req},
      );
      final data = _checkReponse(response) as Map<String, dynamic>;
      return data;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      Map<String, dynamic> profile) async {
    try {
      final response = await _dio.post(
        '/update-profile',
        data: {...profile},
      );

      final data = _checkReponse(response) as Map<String, dynamic>;
      return data;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    try {
      final res = await _dio.get('/get-history');

      final data = (_checkReponse(res) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return data;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  _checkReponse(Response response) {
    final resMap = response.data;
    final status = resMap['status'] as String;
    if (status == 'success') {
      return resMap['data'];
    } else {
      throw Exception("ERROR: Server returned failure");
    }
  }
}
