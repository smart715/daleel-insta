import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insta_daleel/data/datasources/token_cache.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/sign_in/sign_in_behavior.dart';

//Temporaly add SignInBehavior mixin
class TokenInterceptor extends Interceptor with TokenCache, SignInBehavior {
  late String path;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    path = requestPath;
    if (!requestPath.contains('auth')) {
      var accessToken = getToken();
      if (accessToken == null) {
        log('trying to send request without token exist!');
        return super.onRequest(options, handler);
      }
      options.queryParameters['token'] = accessToken;
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response res, ResponseInterceptorHandler handler) {
    if (path.contains('auth/login')) {
      final resMap = res.data;
      final status = resMap['status'] as String;
      if (status == 'success') {
        final token = resMap['access_token'];
        //TODO: THIS IS TEMPORAL REMOVE IT
        signInResponseMap = resMap;
        response = res;
        bearerToken = token;
        //---------

        setBearerToken(token);
      }
    }
    return super.onResponse(res, handler);
  }
}
